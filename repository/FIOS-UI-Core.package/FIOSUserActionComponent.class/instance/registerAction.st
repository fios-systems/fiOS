actions
registerAction
  | newUser |
  super registerAction.
  newUser := FIOSUtility newUser: userName password: password.
  newUser nickname: displayName.
  FIOSUtility bpmApplicationLoginEnabledRole grantUser: newUser ifPresent: [  ].
  action := 'login'.
  (self errorsForSection: 'login')
    add: [ :html | 
      html
        strong: 'Your account is ready';
        paragraph:
            'You may login to your new account now, however, you may need to wait for your system administrator to complete the setup of your account to ensure you can access all the features you require.' ]