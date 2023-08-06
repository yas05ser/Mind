import 'package:app/app_style.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_svg/svg.dart';
//import 'package:get/get.dart';
import 'package:app/quiz/constants.dart';
import 'package:app/quiz/screens/quiz/quiz_screen.dart';

import '../../../components/coustom_bottom_nav_bar.dart';
import '../../../enums.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      bottomNavigationBar: const CustomBottomNavBar( selectedMenu: MenuState.message),
      body: Stack(
        children: [
          
            Image.asset(
                    quizImage,
                   fit: BoxFit.cover
                  ),
          //fit: BoxFit.cover
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Spacer(flex: 2), //2/6
                  Text(
                    "Let's Play Quiz,",
                    style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  const Text("Enter your informations below"),
                  const Spacer(), // 1/6
                  const TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0xFF1C2341),
                      hintText: "Full Name",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                    ),
                  ),
                  const Spacer(), // 1/6
                  ElevatedButton(
                   // onTap: () => (QuizScreen()),//Get.to
                    onPressed: () {  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>  QuizScreen(),
                      ),
                    ); },
                    child: Container(
                      width: double.infinity,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(kDefaultPadding * 0.75), // 15
                      decoration: const BoxDecoration(
                        gradient: kPrimaryGradient,
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                      child: Text(
                        "Lets Start Quiz",
                        style: Theme.of(context)
                            .textTheme
                            .labelLarge
                            ?.copyWith(color: Colors.black),
                      ),
                    ),
                  ),
                  const Spacer(flex: 2), // it will take 2/6 spaces
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
