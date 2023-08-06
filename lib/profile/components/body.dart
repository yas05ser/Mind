// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../HomePage.dart';
import '../../about.dart';
import '../../costume/feedback2.dart';
import 'profile_menu.dart';
import 'profile_pic.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          const ProfilePic(),
          const SizedBox(height: 20),
          ProfileMenu(
            text: "My Account",
            icon: "assets/icons/User Icon.svg",
            press: () => {},
          ),
          ProfileMenu(
            text: "about us",
            icon: "assets/icons/Bell.svg",
            press: () {Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MyAppExplanationPage(),
                      ),
                    );},
          ),
          ProfileMenu(
            text: "Settings",
            icon: "assets/icons/Settings.svg",
            press: () {},
          ),
          ProfileMenu(
            text: "Help Center",
            icon: "assets/icons/Question mark.svg",
            press: () {Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const FeedbackPage2(),
                      ),
                    );},
          ),
          ProfileMenu(
            text: "Log Out",
            icon: "assets/icons/Log out.svg",
            press: () { 
              void signOut() async {
              try {
                await FirebaseAuth.instance.signOut();
                   //  إضافة أي إجراءات إضافية ترغب في تنفيذها بعد تسجيل الخروج هنا
                  // مثلاً إعادة توجيه المستخدم إلى صفحة تسجيل الدخول
                Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HOME(),
                      ),
                    );
                } catch (e) {
                print('حدث خطأ أثناء تسجيل الخروج: $e');
               }
                }},
          ),
        ],
      ),
    );
  }
}
