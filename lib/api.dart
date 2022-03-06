const firebaseApiKey = 'AIzaSyDqAmztERlW0Sqf6t-ffKL9p6S8S_3jKHA';

const webApi = {'domain': 'https://webinar-3a856-default-rtdb.firebaseio.com/'};

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
