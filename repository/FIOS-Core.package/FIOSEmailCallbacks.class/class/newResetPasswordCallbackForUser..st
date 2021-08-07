callback creation
newResetPasswordCallbackForUser: user
  ^ self newCallback: FIOSResetPasswordCallback user: user