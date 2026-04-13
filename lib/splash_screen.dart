import 'package:event/core/constant/app_colors.dart';
import 'package:event/core/thme/app_text_style.dart';
import 'package:event/feature/EventUi/home_event.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

//first root of app

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 90,
              height: 90,
              decoration: BoxDecoration(
                color: AppColors.colorsContainer,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Icon(
                  Icons.local_activity,
                  color: AppColors.colorsIcon,
                  size: 50,
                ),
              ),
            ),

            SizedBox(height: AppTextStyles.SizedBox),

            Text(
              'event',
              style: TextStyle(
                color: AppColors.colorsContainer,
                fontSize: 40,
                fontWeight: FontWeight.bold,
                letterSpacing: 2,
              ),
            ),

            SizedBox(height: AppTextStyles.height),

            Text(
              'Find & enjoy events near you',
              style: TextStyle(color: AppColors.colorsContainer, fontSize: 14),
            ),

            SizedBox(height: 60),

            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => HomeEvent()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.colorsContainer,
                foregroundColor: AppColors.background,
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Text(
                "Accéder à l'accueil",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
