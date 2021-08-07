accessing
renderBlock: anHtmlRenderingBlock rootBlock: rootBlock
  self
    contentString:
      (WAHtmlCanvas builder
        fullDocument: true;
        rootBlock: rootBlock;
        render: anHtmlRenderingBlock)