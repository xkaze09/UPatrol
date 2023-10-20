import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyCQFc8zAsOJEAYZINrkflGzZZ6IsUEKcVs",
            authDomain: "upatrol-cdf52.firebaseapp.com",
            projectId: "upatrol-cdf52",
            storageBucket: "upatrol-cdf52.appspot.com",
            messagingSenderId: "281666506292",
            appId: "1:281666506292:web:480dfc942f97e441680461",
            measurementId: "G-715N8H7K3J"));
  } else {
    await Firebase.initializeApp();
  }
}
