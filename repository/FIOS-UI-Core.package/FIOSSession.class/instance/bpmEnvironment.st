Accessing
bpmEnvironment
  ^ bpmEnvironment ifNil: [ bpmEnvironment := FIOSUtility bpmEnvironment ]