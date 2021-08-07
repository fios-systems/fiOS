private
openTcpConnection
  | ok |
  socket := GsSocket new.
  ok := socket connectTo: self smtpPort on: self mailhostName.
  ok
    ifFalse: [ socket close ].
  ^ ok