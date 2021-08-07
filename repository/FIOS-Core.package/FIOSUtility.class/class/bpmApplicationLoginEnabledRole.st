bpm
bpmApplicationLoginEnabledRole
  ^ self defaultFrontOfficeRoleClass
    createNewOrGetExisting:
      self bpmApplication applicationName , '-loginEnabled'
    in: self bpmApplication applicationName