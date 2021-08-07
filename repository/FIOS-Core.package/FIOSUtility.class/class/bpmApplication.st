bpm
bpmApplication
  | bpmApplication loginEnabledRole |
  bpmApplication := BpmApplication
    getExistingApplicationOrCreateNewNamed: self fiosApplicationName.
  self bpmEnvironment
    registerApplication: bpmApplication
    ifPresent: [  ]
    ifTaken: [  ].
  ^ bpmApplication