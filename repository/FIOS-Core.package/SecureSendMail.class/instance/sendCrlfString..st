private
sendCrlfString: aString
  ^ (socket write: aString , self crlfString) == (aString size + 2)