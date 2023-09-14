import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyD0XpBefaLFq5YjYes8_vWRVV3F7VE9sdA",
            authDomain: "homerental-app-307f0.firebaseapp.com",
            projectId: "homerental-app-307f0",
            storageBucket: "homerental-app-307f0.appspot.com",
            messagingSenderId: "342757197128",
            appId: "1:342757197128:web:7d6262479ad7bb24931f7d",
            measurementId: "G-6H8L32B8V1"));
  } else {
    await Firebase.initializeApp();
  }
}
