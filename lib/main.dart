// ignore_for_file: unnecessary_null_comparison, deprecated_member_use, use_build_context_synchronously, type_init_formals, prefer_const_constructors, prefer_typing_uninitialized_variables

import 'package:app/costume/feedback.dart';
import 'package:flutter/material.dart';
import 'package:app/HomePage.dart';
import 'package:app/costume.dart';
import 'package:app/time.dart';
import 'package:firebase_core/firebase_core.dart';
import 'app_style.dart';
import 'firebase_options.dart';
import 'package:app/pages/login/login.dart';
import 'package:app/pages/signup/signup.dart';
import 'info.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  
  const MyApp({Key? key, }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: appTheme,
      initialRoute: '/',
      routes: {
        '/': (context) =>  HomePage(),
        'nn': (context) => const MyInfo(),
        Signup.id: (context) => const Signup(),
        Login.id: (context) => Login(),
        'cos': (context) => const costume(),
        'time': (context) => const TimePage(),
        'home': (context) => const HOME(),
        'feed': (context) => const FeedbackPage(),
      },
    );
  }
}
