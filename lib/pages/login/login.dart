// ignore_for_file: prefer_const_constructors, use_build_context_synchronously, unnecessary_null_comparison, deprecated_member_use, annotate_overrides

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:app/app_style.dart';
import 'package:app/pages/signup/signup.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  static String id = "/login";

  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  SharedPreferences? _prefs;
  bool check = false;
  final auth = FirebaseAuth.instance;
  late String email;
  late String password;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _showErrorSnackbar(String errorMessage) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(errorMessage),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _initializePreferences();
  }

  Future<void> _initializePreferences() async {
    _prefs = await SharedPreferences.getInstance();
  }

  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.1,
              vertical: size.height * 0.035,
            ),
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
                SizedBox(height: size.height * 0.023),
                Text(
                  "مرحبا بكم في Mind",
                  style: Theme.of(context).textTheme.headline5,
                ),
                SizedBox(height: size.height * 0.018),
                Text(
                  "تسجيل الدخول",
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1!
                      .copyWith(fontSize: 15),
                ),
                SizedBox(height: size.height * 0.020),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        onChanged: (value) {
                          setState(() {
                            email = value;
                          });
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'الرجاء إدخال البريد الإلكتروني';
                          }
                          return null;
                        },
                        style: const TextStyle(color: kLightTextColor),
                        decoration: InputDecoration(
                          hintText: "البريد الإلكتروني",
                          prefixIcon: IconButton(
                            onPressed: null,
                            icon: SvgPicture.asset(userIcon),
                          ),
                        ),
                      ),
                      SizedBox(height: size.height * 0.016),
                      TextFormField(
                        onChanged: (value) {
                          setState(() {
                            password = value;
                          });
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'الرجاء إدخال كلمة المرور';
                          }
                          return null;
                        },
                        obscureText: true,
                        style: const TextStyle(color: kLightTextColor),
                        decoration: InputDecoration(
                          hintText: "كلمة المرور",
                          prefixIcon: IconButton(
                            onPressed: null,
                            icon: SvgPicture.asset(lockIcon),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: size.height * 0.021),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "نسيت كلمة المرور!",
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(color: kTextColor),
                  ),
                ),
                Row(
                  children: [
                    Checkbox(
                      value: check,
                      activeColor: kLightTextColor,
                      onChanged: (bool? value) {
                        setState(() {
                          check = value!;
                        });
                      },
                    ),
                    Text(
                      "احفظ تسجيل دخولي",
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ],
                ),
                SizedBox(height: size.height * 0.029),
                ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      try {
                        var user = await auth.signInWithEmailAndPassword(
                          email: email,
                          password: password,
                        );
                        if (user != null) {
                          _prefs?.setBool('isLoggedIn', true);
                          Navigator.pushNamed(context, 'cos');
                        }
                      } on FirebaseAuthException catch (e) {
                        String errorMessage = '';
                        switch (e.code) {
                          case 'user-not-found':
                            errorMessage = 'البريد الإلكتروني غير صحيح';
                            break;
                          case 'wrong-password':
                            errorMessage = 'كلمة المرور غير صحيحة';
                            break;
                          default:
                            errorMessage = 'حدث خطأ أثناء تسجيل الدخول';
                            break;
                        }
                        _showErrorSnackbar(errorMessage);
                      } catch (e) {
                        _showErrorSnackbar('حدث خطأ أثناء تسجيل الدخول');
                      }
                    }
                  },
                  child: Text(
                    "تسجيل الدخول",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
                SizedBox(height: size.height * 0.029),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "لم تسجل بعد؟\t",
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    CupertinoButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        Navigator.of(context).pushNamedAndRemoveUntil(
                            Signup.id, (route) => false);
                      },
                      child: Text(
                        "انشاء حساب",
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(color: kTextColor),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
//import 'package:firebase_auth/firebase_auth.dart';

// داخل الحدث onPressed لزر تسجيل الخروج
//void signOut() async {
 // try {
 //   await FirebaseAuth.instance.signOut();
    // إضافة أي إجراءات إضافية ترغب في تنفيذها بعد تسجيل الخروج هنا
    // مثلاً إعادة توجيه المستخدم إلى صفحة تسجيل الدخول
  //  Navigator.pushNamed(context, 'login');
 // } catch (e) {
 //   print('حدث خطأ أثناء تسجيل الخروج: $e');
 // }
//}
