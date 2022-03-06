const firebaseApiKey = 'Your project API key';

const webApi = {'domain': '<Your project real time database link>'};

const endPoints = {
  'user': 'user.json',
  'todojson': 'todo.json',
  'todo': 'todo'
};

const authEndPoints = {
  'signup':
      'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=$firebaseApiKey',
  'login':
      'https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=$firebaseApiKey'
};
