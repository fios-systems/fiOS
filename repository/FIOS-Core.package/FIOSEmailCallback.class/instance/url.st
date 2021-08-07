Accessing
url
  | request |
  ^ String
    streamContents: [ :stream | 
      request := WACurrentRequestContext value request.
      stream
        nextPutAll:
          (request isSsl
            ifTrue: [ 'https://' ]
            ifFalse: [ 'http://' ]).
      stream
        nextPutAll: request host;
        nextPutAll: '/';
        nextPutAll: (request url path reduce: [ :a :b | a , '/' , b ]);
        nextPutAll: '/emailCallback/';
        nextPutAll: self key asString ]