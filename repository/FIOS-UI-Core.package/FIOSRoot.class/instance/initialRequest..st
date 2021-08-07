hooks
initialRequest: aRequest
  super initialRequest: aRequest.
  (aRequest uri path includes: 'emailCallback')
    ifTrue: [ 
      | key callback |
      key := aRequest uri path
        at: (aRequest uri path indexOf: 'emailCallback') + 1.
      callback := FIOSEmailCallbacks getWithKeyOrNil: key.
      callback
        ifNil: [ self loginComponent action: 'invalidCallback' ]
        ifNotNil: [ :c | callback execute: self ] ]