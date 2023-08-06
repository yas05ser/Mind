// ignore_for_file: unused_field, library_private_types_in_public_api, deprecated_member_use
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:app/app_style.dart';

import '../components/coustom_bottom_nav_bar.dart';
import '../enums.dart';



class FeedbackPage extends StatefulWidget {
  const FeedbackPage({super.key});

  @override
  _FeedbackPageState createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
  String selectedEmoji = '';

  void sendFeedback() {
    // رمز البريد الإلكتروني الذي ترغب في إرسال الرسالة إليه
    String email = 'larouyasser28@gmail.com';
    // عنوان البريد الإلكتروني
    String subject = 'تعليق من تطبيقي';
    // الرسالة
    String message = 'تعليقاتي وملاحظاتي حول الجلسة:\n\n';

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
            const SizedBox(height: 50),
            const Text(
              'كيف تشعر بعد هذه الجلسة؟',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedEmoji = 'سعيد';
                    });
                  },
                  child: Text(
                    '😄',
                    style: TextStyle(
                      fontSize: 40,
                      color:
                          selectedEmoji == 'سعيد' ? Colors.green : Colors.black,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedEmoji = 'غير سعيد';
                    });
                  },
                  child: Text(
                    '😞',
                    style: TextStyle(
                      fontSize: 40,
                      color: selectedEmoji == 'غير سعيد'
                          ? Colors.red
                          : Colors.black,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedEmoji = 'راض';
                    });
                  },
                  child: Text(
                    '😊',
                    style: TextStyle(
                      fontSize: 40,
                      color:
                          selectedEmoji == 'راض' ? Colors.blue : Colors.black,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 60),
            const Text(
              'اترك لنا تعليق وكيف يمكننا تحسين الجلسات',
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
