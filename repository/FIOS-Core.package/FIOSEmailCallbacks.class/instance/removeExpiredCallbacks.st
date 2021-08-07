Accessing
removeExpiredCallbacks
  callbacks removeAll: (callbacks select: [ :callback | callback isExpired ])