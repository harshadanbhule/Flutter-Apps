
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:rento/views/splash.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: 'AIzaSyBVfj87pQP89msx5UxICxI0gAGGQjfONko',
      appId: '1:1090505287430:android:382806f1a84385561e6087',
      messagingSenderId: '1090505287430',
      projectId: 'rento-c4d09',
    ),
  );
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      //theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: Splash(),
    );
  }
}