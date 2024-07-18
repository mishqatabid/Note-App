import 'dart:developer';

import 'package:notepad/src/screens/home_screen.dart';
import 'package:notepad/src/screens/auth_screen/login_screen.dart';
import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';

class PreApp extends StatelessWidget {
  const PreApp({Key? key}) : super(key: key);

  // Future - single async call
  // (suitable when delay is possible)
  // youtube subscription page, where on refresh you see the new videos

  // Stream - multiple async call
  // (suitable when we need latest data in instant)
  // (super reactive like whatsapp chats)

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance
          .authStateChanges(), // when user changes builder will run again
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          log("connection state is waiting");
          return const Center(child: Text('Loading'));
        } else if (snapshot.hasError) {
          log(snapshot.error.toString());
          return Center(child: Text(snapshot.error.toString()));
        } else if (snapshot.hasData) {
          // user is logged in
          return const HomeScreen();
        } else {
          //user is null
          return LoginScreen();
        }
      },
    );
  }
}
