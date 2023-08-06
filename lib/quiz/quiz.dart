// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
//import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:app/quiz/screens/welcome/welcome_screen.dart';





class quiz extends StatelessWidget {


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const WelcomeScreen(),
      
    );
  }
}
