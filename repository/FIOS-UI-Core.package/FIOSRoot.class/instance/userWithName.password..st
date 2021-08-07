validator
userWithName: userName password: password
  | loginMode |
  loginMode := self getGemStoneServerConfiguration
    loginModeFor: 'orbeon-processes-web'.
  (loginMode validateUser: userName asLowercase password: password)
    ifTrue: [ 
      (BpmUser getUserNamed: userName asLowercase ifAbsent: [ nil ])
        ifNotNil: [ :loggedInUser | 
          (loggedInUser
            includesAnyRoleOf: {(FIOSUtility bpmApplicationLoginEnabledRole)}
            in: FIOSUtility bpmEnvironment)
            ifTrue: [ ^ loggedInUser ] ] ].
  ^ nil