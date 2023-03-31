importScripts("https://www.gstatic.com/firebasejs/9.18.0/firebase-app.js");
importScripts("https://www.gstatic.com/firebasejs/9.18.0/firebase-messaging.js");

//Using singleton breaks instantiating messaging()
// App firebase = FirebaseWeb.instance.app;

firebase.initializeApp({
  apiKey: "AIzaSyBQx-7ZGkxi08pNR4exenZEcn-zjBCtUco",
  authDomain: "books-course-work-1.firebaseapp.com",
  projectId: "books-course-work-1",
  storageBucket: "books-course-work-1.appspot.com",
  messagingSenderId: "626801727731",
  appId: "1:626801727731:web:68e34c52dc748314f03f86",
  measurementId: "G-J8Y8N1F0MB"
});

const messaging = firebase.messaging();
messaging.setBackgroundMessageHandler(function (payload) {
    const promiseChain = clients
        .matchAll({
            type: "window",
            includeUncontrolled: true
        })
        .then(windowClients => {
            for (let i = 0; i < windowClients.length; i++) {
                const windowClient = windowClients[i];
                windowClient.postMessage(payload);
            }
        })
        .then(() => {
            return registration.showNotification("New Message");
        });
    return promiseChain;
});
self.addEventListener('notificationclick', function (event) {
    console.log('notification received: ', event)
});