import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyDmxilRK10ixgSDBfXg16w1D8mf92JZQYY",
            authDomain: "caunsel.firebaseapp.com",
            projectId: "caunsel",
            storageBucket: "caunsel.appspot.com",
            messagingSenderId: "709835586683",
            appId: "1:709835586683:web:bb9137e1dd3f4d277db6de",
            measurementId: "G-MMMN3LTP5C"));
  } else {
    await Firebase.initializeApp();
  }
}
