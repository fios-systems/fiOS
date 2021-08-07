smtp
testMail
  "FIOSUtility testMail"

  | client host |
  client := SecureSendMail new.
  client
    ownDomainName: 'fios.com.au';
    smtpPort: 587;
    mailhostName: 'email-smtp.us-east-1.amazonaws.com';
    user: 'AKIATQ3SUS35PT73FF4J';
    password: 'BF3YX43v2uHE8eQo3d4cO4Gc0tbQPW53eIJCJ40F+Dj2'.
  client
    from: 'system-admin@fios.com.au';
    to: 'jupiter@tai.earth';
    subject: 'Password Reset';
    text: 'Testing only. Here is a link to reset your password'.
  [ client send ]
    on: Error
    do: [ :err | self halt ]