private
sendData
  ^ (socket write: text) == text size