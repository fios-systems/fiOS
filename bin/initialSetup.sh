#! /usr/bin/env bash

# Setup
userName=$USER
export stoneName=fios
gemstoneVersion=3.6.3

# just get the sudo out of the way first
sudo date

# update apt repos and out of date packages
sudo apt-get update
sudo apt-get -y upgrade

# install old git
sudo apt-get install git

# install new git
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null
sudo apt update
sudo apt install gh

# Create the install structure
echo '[Info] Setting up structure in /opt'
sudo chown $userName /opt

if [ ! -e /opt/git/GsDevKit ]
	then
		echo '[Info] Cloning GsDevKit_home in /opt/git/GsDevKit'
		mkdir -p /opt/git/GsDevKit
		cd /opt/git/GsDevKit
		git clone https://github.com/GsDevKit/GsDevKit_home.git
		ln -s /opt/git/GsDevKit/GsDevKit_home /opt
	else
		echo "[Warning] /opt/git/GsDevKit directory already exists"
    	echo "to replace it, remove or rename it and rerun this script"
fi

if [ ! -e /opt/git/JupiterSmalltalk ]
	then
		echo '[Info] Cloning BpmFlow in /opt/git/JupiterSmalltalk'
		mkdir -p /opt/git/JupiterSmalltalk
		cd /opt/git/JupiterSmalltalk
		git clone git@github.com:JupiterSmalltalk/BpmFlow.git
	else
		echo "[Warning] /opt/git/JupiterSmalltalk directory already exists"
    	echo "to replace it, remove or rename it and rerun this script"
fi

if [ ! -e /opt/git/fios-systems ]
	then
		echo '[Info] Cloning fiOS in /opt/git/fios-systems'
		mkdir -p /opt/git/fios-systems
		cd /opt/git/fios-systems
		git clone git@github.com:fios-systems/fiOS.git
	else
		echo "[Warning] /opt/git/fios-systems directory already exists"
    	echo "to replace it, remove or rename it and rerun this script"
fi

# Add env variables to .bash_profile
echo '[Info] Additions to .bash_profile (create if necessary)'
touch ~/.bash_profile
cat - > ~/.bash_profile << EOF

# GemStone
export GS_HOME=/opt/GsDevKit_home
PATH=\$GS_HOME/bin:\$PATH
export BPM_HOME=/opt/git/JupiterSmalltalk/BpmBlow
PATH=\$BPM_HOME/bin

EOF

source ~/.bash_profile

echo '[Info] Patch .profile to source .bash_profile (create if necessary)'
touch ~/.profile
if [ `grep -sc "source .bash_profile"  ~/.profile` -eq 0 ]; then
	cat - >> ~/.profile << EOF

# Source .bash_profile for local logins as well
source .bash_profile

EOF
fi

source ~/.bash_profile


# Add a specific port to /etc/service just so we can clearly define the netldi port.
# This is so we can define the same port on the production server to allow remote access
if [ `grep -sc "^fios_ldi" /etc/services` -eq 0 ]; then
	echo '[Info] Adding "fios_ldi  50380/tcp" to /etc/services'
	sudo bash -c 'echo "fios_ldi         50380/tcp        # fios_ldi netldi"  >> /etc/services'
else
    echo "[Info] GemStone fios_ldi service port is already set in /etc/services"
    echo "To change it, remove the following line from /etc/services and rerun this script"
    grep "^fios_ldi" /etc/services
fi


# Install nginx
echo '[Info] Installing nginx'
sudo apt-get -y install nginx-full

# Install our site
if [ ! -e /etc/nginx/sites-enabled/nginx_${stoneName}.conf ]
	then
		sudo ln -s /opt/git/fios-systems/fiOS/nginx/nginx_${stoneName}.conf /etc/nginx/sites-enabled
	else
		echo "[Info] There is already a link to the nginx conf at /etc/nginx/sites-enabled/nginx_${stoneName}.conf"
		echo "To relink it, remove the that file and rerun this script"
fi

# remove the default config
if [ -e /etc/nginx/sites-enabled/default ]
	then
		sudo rm -f /etc/nginx/sites-enabled/default 
fi

# restart
sudo nginx -s reload




# Setup OS for GemStone
echo '[Info] Setup OS for GemStone'
installServerClient

# Install tODE tools in Pharo, create the stone, launch the tODE IDE
echo '[Info] Setup $stoneName and tODE IDE'
createStone $stoneName $gemstoneVersion

# Increate the memory allocation for gems in development
if [ `grep -sc "500000" /opt/GsDevKit_home/server/stones/${stoneName}/gem.conf` -eq 0 ]; then
	sed -i 's/50000/500000/' /opt/GsDevKit_home/server/stones/${stoneName}/gem.conf
fi

createClient dev

# Install fiOS code
echo '[Info] Setup fiOS'

$GS_HOME/bin/startTopaz $stoneName -il  -T 900000 <<EOF >>install-all.log
set user DataCurator password swordfish gemstone $stoneName
login
exec
Gofer new
  package: 'GsUpgrader-Core';
  url: 'http://ss3.gemtalksystems.com/ss/gsUpgrader';
  load.
(Smalltalk at: #GsUpgrader) upgradeGrease.
GsDeployer deploy: [
  Metacello new
    baseline: 'Seaside3';
    repository: 'github://SeasideSt/Seaside:master/repository';
    onLock: [:ex | ex honor];
    load: 'CI';
    lock ].
%
logout
quit
EOF

echo '[Info] Bootstrap Seaside tools for tODE'

todeIt $stoneName mount @/sys/stone/dirs/Seaside3/tode /home seaside

echo '[Info] Done'
