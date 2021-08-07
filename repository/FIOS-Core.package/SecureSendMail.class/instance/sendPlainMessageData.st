private
sendPlainMessageData
  ^ (socket write: self plainMessage) == self plainMessage size