import 'package:flutter/material.dart';
import 'app_style.dart';
import 'components/coustom_bottom_nav_bar.dart';
import 'enums.dart';

class MyAppExplanationPage extends StatelessWidget {
  const MyAppExplanationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const CustomBottomNavBar( selectedMenu: MenuState.profile),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Directionality(
          textDirection:
              TextDirection.rtl, // Set text direction to right-to-left
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
              const Text(
                'ماهو تطبيق MIND!',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'هو تطبيق متخصص في المجال المعرفي التعليمي يساعد المتعلم على تحسين التركيز و التذكر ، كما يساعده على التخفيف من القلق والتوتر الذي يمكن أن يصاحبه أثناء الدراسة ',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 20),
              const Text(
                'يتضمن التطبيق المحاور التالية:',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                ' •لمن يعاني من النسيان ',
                style: TextStyle(fontSize: 16),
              ),
              const Text(
                '• لمن يعاني من قلة التركيز',
                style: TextStyle(fontSize: 16),
              ),
              const Text(
                '• لمن يعني من القلق',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 20),
              const Text(
                ' • بحيث يخصص لكل محور مجموعة من التمارين التي صممت في ضوء النظريات النفسية والتربوية ، يعمل هذا التطبيق وفق مجموعة خطوات ينبغي على المستخدم المرور بها قبل الشروع في التمارين الخاصة بكل جزء في هذا التطبيق',
                style: TextStyle(
                  fontSize: 16,
                  // fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'نحن نأمل أن ينال التطبيق إعجابك وأن يكون مفيدًا لك.',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
