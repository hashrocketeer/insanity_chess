App.ApplicationAdapter = DS.FirebaseAdapter.extend
  firebase: new Firebase('https://radiant-fire-6682.firebaseio.com')

App.ApplicationSerializer = DS.FirebaseSerializer.extend()
