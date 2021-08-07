callback creation
newCallback: callbackClass user: user
  | callback |
  callback := callbackClass new
    user: user;
    yourself.
  self instance callbacks add: callback.
  ^ callback