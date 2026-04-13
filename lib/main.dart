import 'package:event/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyAppEvent());
}

//rroot of app
class MyAppEvent extends StatelessWidget {
  MyAppEvent({super.key});

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
