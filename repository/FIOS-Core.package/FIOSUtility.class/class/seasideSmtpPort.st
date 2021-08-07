seaside
seasideSmtpPort
  ^ self
    seasideHandlerPreferenceAt: #'smtpPort'
    ifAbsent: [ SendMail new smtpPort ]