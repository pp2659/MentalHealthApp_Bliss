import 'package:bliss/Questions/testhealth_Age.dart';
import 'package:bliss/Screen/Appointment.dart';
import 'package:bliss/constants.dart';
import 'Screen/SocialMedia.dart';
import 'Screen/screen1.dart';
import 'Screen/LoginPage.dart';
import 'Screen/RegistrationPage.dart';
import 'Screen/Feeling.dart';
import 'Screen/DetailsPage.dart';
import 'Screen/dashboard.dart';
import 'Screen/Diary.dart';
import 'Screen/MusicPlayer.dart';

import 'Screen/profile.dart';
import 'package:flutter/material.dart';
import 'Screen/Diary Text.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData().copyWith(primaryColor: mainColor),
      debugShowCheckedModeBanner: false,
      routes: {
        '/login': (context) => AuthScreen(),
        '/feeling': (context) => Feeling(),
        '/details': (context) => DetailsPage(),
        '/dashboard': (context) => Dashboard(),
        '/diary': (context) => Journal(),
        '/playpage': (context) => PlayPage(),
        //'/chat': (context) => Chat(),
        '/profile': (context) => Profile(),
        '/diarytext': (context) => DiaryText(),
        '/socialmedia': (context) =>SocialMedia(),
        '/testhealth': (context) =>TestHealth(),
      },
      home: Dashboard(),
    );
  }
}
