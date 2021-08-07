bpm
newUser: userName password: password
  ^ BpmUser
    getExistingOrNewUserNamed: userName
    password: password
    forEnvironment: self bpmEnvironment