// ignore_for_file: unused_field, library_private_types_in_public_api, deprecated_member_use
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:app/app_style.dart';

import '../components/coustom_bottom_nav_bar.dart';
import '../enums.dart';



class FeedbackPage2 extends StatefulWidget {
  const FeedbackPage2({super.key});

  @override
  _FeedbackPage2State createState() => _FeedbackPage2State();
}

class _FeedbackPage2State extends State<FeedbackPage2> {
  String selectedEmoji = '';

  void sendFeedback() {
    // رمز البريد الإلكتروني الذي ترغب في إرسال الرسالة إليه
    String email = 'larouyasser28@gmail.com';
    // عنوان البريد الإلكتروني
    String subject = 'تعليق من تطبيقي';
    // الرسالة
    String message = ' استفساراتكم!:\n\n';

    // إنشاء رابط البريد الإلكتروني
    String uri = 'mailto:$email?subject=$subject&body=$message';

    // فتح تطبيق البريد الإلكتروني
    launch(uri);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const CustomBottomNavBar(selectedMenu:MenuState.profile),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Image.asset(
                logoImage,
                height: 150,
                width: 150,
              ),
            ),   
            const SizedBox(height: 60),
            const Text(
              'اترك لنا تعليق وكيف يمكننا تحسين التطبيق',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 10),
            TextFormField(
              maxLines: 3,
              style: const TextStyle(
                  color: Colors.black), // تغيير لون النص إلى اللون الأسود
              decoration: const InputDecoration(
                hintText: 'اترك تعليق',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: sendFeedback,
              child: const Text('إرسال'),
            ),
          ],
        ),
      ),
    );
  }
}
