seaside
seasideSmtpServer
  ^ self
    seasideHandlerPreferenceAt: #'smtpServer'
    ifAbsent: [ 
      "SecureSendMail mailhost"
       ]