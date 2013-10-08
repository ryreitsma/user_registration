var TRANSLATIONS = {
  nl: {
    iWantThatApp: 'Ja, ik wil die Coconut app!',
    users: {
      name: 'naam',
      email: 'e-mailadres'
    }
  }
};

function locale() {
  return 'nl';
}

function t(key) {
  var keyPartArray = key.split('.');
  keyPartArray.unshift(locale());

  var current = TRANSLATIONS;
  for (var i = 0; i < keyPartArray.length; i++) {
    current = current[keyPartArray[i]];
  }

  return current;
}
