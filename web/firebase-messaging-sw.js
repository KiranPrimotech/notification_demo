importScripts('https://www.gstatic.com/firebasejs/8.4.1/firebase-app.js');
importScripts('https://www.gstatic.com/firebasejs/8.4.1/firebase-messaging.js');


   /*Update with yours config*/
  const firebaseConfig = {
     apiKey: 'AIzaSyDL6y4uj8T5Dggv25gdGve3HFHqBwYHI_Q',
     appId: '1:673998289049:web:ddb2630918e4bd8b9da008',
     messagingSenderId: '673998289049',
     projectId: 'notificationdemo-cc5ae',
     authDomain: 'notificationdemo-cc5ae.firebaseapp.com',
     databaseURL: 'https://notificationdemo-cc5ae-default-rtdb.asia-southeast1.firebasedatabase.app',
     storageBucket: 'notificationdemo-cc5ae.appspot.com',
     measurementId: 'G-ZWTDCXBFHP',
   };

      firebase.initializeApp(firebaseConfig);
      const messaging = firebase.messaging();

//  /*messaging.onMessage((payload) => {
//  console.log('Message received. ', payload);*/
//  messaging.onBackgroundMessage(function(payload) {
//    console.log('Received background message ', payload);
//
//    const notificationTitle = payload.notification.title;
//    const notificationOptions = {
//      body: payload.notification.body,
//    };
//
//    self.registration.showNotification(notificationTitle,
//      notificationOptions);
//  });