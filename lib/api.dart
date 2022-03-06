const firebaseApiKey = 'AIzaSyAyTDTgHxWGtw39f3Del-EbS3cpjeX-9BM';

const webApi = {'domain': 'https://webinar-new-project-default-rtdb.firebaseio.com/'};

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
