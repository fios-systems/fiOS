configuration
configureApplication: application
  super configureApplication: application.
  application preferenceAt: #'sessionClass' put: FIOSSession.
  application configuration addParent: WAEmailConfiguration instance.
  application configuration
    at: #'smtpServer' put: 'email-smtp.us-east-1.amazonaws.com';
    at: #'smtpPort' put: 587;
    at: #'smtpUsername' put: 'AKIATQ3SUS35PT73FF4J';
    at: #'smtpPassword' put: 'BF3YX43v2uHE8eQo3d4cO4Gc0tbQPW53eIJCJ40F+Dj2';
    at: #'reCaptchaSiteKey' put: '6Lcx59UaAAAAAJ--2J-85rtQSw9jsDlI22iMGTBE';
    at: #'reCaptchaSecretKey' put: '6Lcx59UaAAAAAOl7HsRpDY26v25QH1S_IYY3P7S9'