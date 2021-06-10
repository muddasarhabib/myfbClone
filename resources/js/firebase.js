// import firebase from 
import firebase from 'firebase'
import 'firebase/firestore'


const firebaseConfig = {
    apiKey: 'AIzaSyARbxUi57xJNPH3v63dlM3JgFvBI49ibAg',
    authDomain: 'facebook-clone-8b022.firebaseapp.com',
    databaseURL: 'https://facebook-clone-8b022-default-rtdb.firebaseio.com',
    projectId: 'facebook-clone-8b022',
    storageBucket: 'facebook-clone-8b022.appspot.com',
    messagingSenderId: "559108909129",
    appId: "1:559108909129:web:9cd1b268fcae2062937798",
    measurementId: "G-WZD93VHR5K"
  }
  const firebaseApp = firebase.initializeApp(firebaseConfig)
  const db= firebase.firestore();
  const auth= firebase.auth();
  const storage= firebase.storage();
 
  export  {
    db,
    auth,
    storage
  }