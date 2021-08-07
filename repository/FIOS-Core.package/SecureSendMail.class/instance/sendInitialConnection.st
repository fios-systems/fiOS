private
sendInitialConnection
  | helo rc |
  helo := self heloString.
  rc := self sendCrlfString: helo , self ownDomainName.
  rc
    ifTrue: [ 
      rc
        ifTrue: [ rc := self readSmtpResult ].
      rc
        ifTrue: [ rc := self sendCrlfString: 'STARTTLS' ].
      rc
        ifTrue: [ rc := self readSmtpResult ] ].
  ^ rc