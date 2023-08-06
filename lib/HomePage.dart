// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:app/pages/login/login.dart';
import 'package:app/pages/signup/signup.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Set the duration for automatic navigation
    const Duration duration = Duration(seconds: 5);

    // Start the timer
    Timer(duration, () {
      // Navigate to the next page
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const HOME()),
      );
    });

    return const Scaffold(
      body: Stack(
        children: [
          CoverImageWidget(),
          // Add other widgets on top of the image as needed
        ],
      ),
    );
  }
}

class CoverImageWidget extends StatelessWidget {
  const CoverImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Image.asset(
        'assets/Green.png', // Replace with the path to your image
        fit: BoxFit.cover,
      ),
    );
  }
}

class HOME extends StatefulWidget {
  const HOME({super.key});

  @override
  State<HOME> createState() => _HOMEState();
}

class _HOMEState extends State<HOME> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 1.2,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/home.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context)
                          .pushNamedAndRemoveUntil(Login.id, (route) => false);
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.black,
                      minimumSize: const Size(400, 50),
                    ),
                    child: const Text('تسجيل الدخول'),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context)
                          .pushNamedAndRemoveUntil(Signup.id, (route) => false);
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.black,
                      backgroundColor: Colors.white,
                      minimumSize: const Size(400, 50),
                    ),
                    child: const Text('إنشاء حساب'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
