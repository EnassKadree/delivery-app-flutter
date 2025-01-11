importScripts('https://www.gstatic.com/firebasejs/9.0.0/firebase-app.js');
importScripts('https://www.gstatic.com/firebasejs/9.0.0/firebase-messaging.js');

// استبدل هذا بمعرفك الفريد من Firebase
const firebaseConfig = {
    apiKey: "AIzaSyBdJMIXhsOjbk0fjfmPGKnCnUtl_sFenzA",
    authDomain: "push-notifications-48339.firebaseapp.com",
    projectId: "push-notifications-48339",
    storageBucket: "push-notifications-48339.firebasestorage.app",
    messagingSenderId: "259979143938",
    appId: "1:259979143938:web:e6d68a365ff6869434701b",
    measurementId: "G-1JC71KZJH0"
};

firebase.initializeApp(firebaseConfig);

const messaging = firebase.messaging();
