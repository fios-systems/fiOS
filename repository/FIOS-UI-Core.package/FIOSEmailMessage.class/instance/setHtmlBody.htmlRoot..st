accessing
setHtmlBody: aBlock htmlRoot: rootBlock
  "block should be in the form of a [:h | h render: 'hello world']"

  self addPart: (FIOSHtmlEmailBody renderingBlock: aBlock rootBlock: rootBlock)