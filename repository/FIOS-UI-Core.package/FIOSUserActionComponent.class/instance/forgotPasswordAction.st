actions
forgotPasswordAction
  | pathToTemplate templateDocument finalDocument context aUser callback |
  super forgotPasswordAction.
  aUser := BpmUser getUserNamed: self userName.
  aUser
    ifNil: [ (Delay forSeconds: 5) wait ]
    ifNotNil: [ 
      callback := (FIOSEmailCallbacks newResetPasswordCallbackForUser: aUser)
        expiry: DateAndTime now + 2 hours;
        yourself.
      context := Dictionary new
        at: 'resetLink' put: callback url;
        at: 'expirationInterval' put: '2 hours';
        at: 'expirationTime' put: callback expiry AustralianDateAndTimeFormat;
        yourself.
      pathToTemplate := self emailTemplateBasePath , 'forgotPassword.html'.
      templateDocument := GRPlatform current
        contentsOfFile: pathToTemplate
        binary: false.
      finalDocument := (MustacheTemplate on: templateDocument) value: context.
      FIOSUtility
        seasideDeliverEmailMessage:
          ((FIOSEmailMessage
            from:
              (WAEmailAddress
                address: 'system-admin@fios.com.au'
                username: 'fiOS System Services')
            to: (WAEmailAddress address: self userName)
            subject: 'Password Reset')
            addPart:
                (FIOSHtmlEmailBody new
                    contentString: finalDocument;
                    yourself);
            yourself)	"setStringBody: self stringVersionOfForgotPasswordEmail;" ]