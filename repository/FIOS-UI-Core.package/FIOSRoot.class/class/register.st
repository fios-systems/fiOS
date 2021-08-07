utilities
register
  "self register"

  FIOSEmailCallbacks reset.
  WAAdmin enableDevelopmentTools.
  self configureApplication: (WAAdmin register: self asApplicationAt: 'fiOS')