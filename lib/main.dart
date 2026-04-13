import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:event/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyAppEvent());
}

class MyAppEvent extends StatelessWidget {
  const MyAppEvent({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'EventLife',
      theme: ThemeData(primaryColor: Colors.orange, fontFamily: 'Sans'),
      home: SplashScreen(),
    );
  }
}
