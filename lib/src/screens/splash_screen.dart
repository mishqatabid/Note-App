import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:notepad/pre_app.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// ignore: depend_on_referenced_packages
import 'package:page_transition/page_transition.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: AnimatedSplashScreen(
        splash: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/notepad.png",
              width: 200.r,
              height: 200.r,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'NoteSnap!!',
              style: TextStyle(fontSize: 30.sp, color: Colors.white),
            ),
          ],
        ),
        nextScreen: const PreApp(), //homescreen
        curve: Curves.ease,
        backgroundColor: const Color.fromRGBO(0, 0, 0, 1),
        splashIconSize: 1.sw,
        duration: 100,
        splashTransition: SplashTransition.sizeTransition,
        pageTransitionType: PageTransitionType.bottomToTop,
        animationDuration: const Duration(seconds: 20),
      ),
    );
  }
}
