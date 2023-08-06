// ignore_for_file: deprecated_member_use, unused_local_variable, library_private_types_in_public_api, unused_field

import 'dart:async';
import 'package:flutter/material.dart';
import '../app_style.dart';
import '../components/coustom_bottom_nav_bar.dart';
import '../enums.dart';





class ImageGamePage extends StatefulWidget {
  const ImageGamePage({Key? key}) : super(key: key);

  @override
  _ImageGamePageState createState() => _ImageGamePageState();
}

class _ImageGamePageState extends State<ImageGamePage> {
  List<String> images = [
    'assets/nissyane.png',
  ];

  int currentIndex = 0;
  bool showImage = true;
  bool passedTest = false;

  TextEditingController answerController = TextEditingController();
  bool isAnswerIncorrect = false;

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 30), () {
      setState(() {
        showImage = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      bottomNavigationBar: const CustomBottomNavBar(selectedMenu:MenuState.home),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Image.asset(
                logoImage,
                height: 150,
                width: 150,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              "لعبة الذاكرة",
              style: Theme.of(context).textTheme.headline5,
            ),
            const SizedBox(height: 20),
            if (showImage)
              Image.asset(
                images[currentIndex],
                height: 500,
                width: 600,
              ),
            const SizedBox(height: 20),
            if (!showImage && !passedTest)
              Column(
                children: [
                  const Text(
                    'ما هي الأشياء الموجودة في الصورة؟',
                    style: TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: 400,
                    child: TextField(
                      controller: answerController,
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        hintText: 'أدخل الإجابة',
                        errorText: isAnswerIncorrect ? 'الإجابة خاطئة' : null,
                      ),
                    ),
                  ),
                  const SizedBox(height: 50),
                  ElevatedButton(
                    onPressed: checkAnswer,
                    child: const Text('تحقق'),
                  ),
                ],
              ),
            const SizedBox(height: 20),
            if (passedTest)
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, 'feed');
                },
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      side: const BorderSide(color: Colors.grey),
                    ),
                  ),
                ),
                child: const Text('التالي'),
              ),
            const SizedBox(height: 20),
            if (passedTest)
              const Text(
                'لقد اجتزت الاختبار بنجاح!',
                style: TextStyle(fontSize: 18),
              ),
          ],
        ),
      ),
    );
  }

  void checkAnswer() {
    String answer = answerController.text.trim();
    int correctAnswers = 0;

    // قم بتعديل الجملة التالية لتحتوي على الأشياء الصحيحة في الصورة الحالية
    List<String> correctAnswersList = [
      'كولا',
      'مفتاح',
      'شمعة',
      'شوكة',
      'ساعة',
      'صحن',
      'كاس',
      'قارورة',
      'قداحة',
      'دواء',
      'قلم',
      'ملعقة',
      'وردة',
      'منديل',
    ];

    for (String correctAnswer in correctAnswersList) {
      if (answer.contains(correctAnswer)) {
        correctAnswers++;
      }
    }

    double accuracy = correctAnswers / correctAnswersList.length;
    if (accuracy > 0.7) {
      setState(() {
        passedTest = true;
      });
    } else {
      setState(() {
        isAnswerIncorrect = true;
        currentIndex = (currentIndex + 1) % images.length;
        showImage = true;
        Timer(const Duration(seconds: 2), () {
          setState(() {
            showImage = false;
            isAnswerIncorrect = false;
            answerController.clear();
          });
        });
      });
    }
  }

  @override
  void dispose() {
    answerController.dispose();
    super.dispose();
  }
}
