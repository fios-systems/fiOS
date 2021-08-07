Accessing
bpmApplication
  ^ bpmApplication ifNil: [ bpmApplication := FIOSUtility bpmApplication ]