accessing callbacks
getWithKeyOrNil: key
  | uuid |
  uuid := (key isKindOf: String)
    ifTrue: [ UUID fromString: key ]
    ifFalse: [ key ].
  ^ self instance callbacks
    detect: [ :callback | callback key = uuid ]
    ifNone: [ nil ]