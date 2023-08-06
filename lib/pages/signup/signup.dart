// ignore_for_file: library_private_types_in_public_api, unused_element, use_build_context_synchronously, avoid_print, deprecated_member_use

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../app_style.dart';
import '../login/login.dart';

class Signup extends StatefulWidget {
  static String id = "/signup";

  const Signup({Key? key}) : super(key: key);

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final auth = FirebaseAuth.instance;
  late String username;
  late String email;
  late String password;
  late String confirmPassword;
  late String errorMessage;

  @override
  void initState() {
    initializeFirebase();
    super.initState();
  }

  Future<void> initializeFirebase() async {
    await Firebase.initializeApp();
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _navigateToNextPage() {
    if (_formKey.currentState!.validate()) {
// All fields are filled, navigate to next page
      Navigator.pushNamed(context, 'nn');
      
    } else {
// Display notification if any fields are empty
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('من فضلك املأ جميع الحقول'),
        ),
      );
    }
  }

  Future<void> checkIfEmailExists() async {
    try {
      var methods = await auth.fetchSignInMethodsForEmail(email);
      if (methods.isNotEmpty) {
        setState(() {
          errorMessage = 'البريد الإلكتروني مسجل من قبل';
        });
      } else {
// Continue with registration process
        await auth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
        Navigator.pushNamed(context, 'nn');
       
        
      }
    } catch (error) {
      print(error);
    }
  }

  @override
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
                  "تسجيل جديد",
                  style: Theme.of(context).textTheme.headline5,
                ),
                SizedBox(height: size.height * 0.018),
                Text(
                  "انشاء حساب جديد",
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
                          email = value;
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'يرجى ملء البريد الإلكتروني';
                          }
                          return null;
                        },
                        style: const TextStyle(color: kLightTextColor),
                        decoration: InputDecoration(
                          hintText: "البريد الالكتروني",
                          prefixIcon: IconButton(
                            onPressed: null,
                            icon: SvgPicture.asset(emailIcon),
                          ),
                        ),
                      ),
                      SizedBox(height: size.height * 0.016),
                      TextFormField(
                        onChanged: (value) {
                          username = value;
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'يرجى ملء اسم المستخدم';
                          }
                          return null;
                        },
                        style: const TextStyle(color: kLightTextColor),
                        decoration: InputDecoration(
                          hintText: "الاسم المستخدم",
                          prefixIcon: IconButton(
                            onPressed: null,
                            icon: SvgPicture.asset(userIcon),
                          ),
                        ),
                      ),
                      SizedBox(height: size.height * 0.016),
                      TextFormField(
                        onChanged: (value) {
                          password = value;
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'يرجى ملء كلمة المرور';
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
                      SizedBox(height: size.height * 0.016),
                      TextFormField(
                        onChanged: (value) {
                          confirmPassword = value;
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'يرجى ملء تأكيد كلمة المرور';
                          }
                          if (value != password) {
                            return 'تأكيد كلمة المرور غير متطابقة';
                          }
                          return null;
                        },
                        obscureText: true,
                        style: const TextStyle(color: kLightTextColor),
                        decoration: InputDecoration(
                          hintText: "تاكيد كلمة المرور",
                          prefixIcon: IconButton(
                            onPressed: null,
                            icon: SvgPicture.asset(lockIcon),
                          ),
                        ),
                      ),
                      SizedBox(height: size.height * 0.025),
                      ElevatedButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            await checkIfEmailExists();
                          }
                        },
                        child: Text(
                          "انشئ حسابك",
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: size.height * 0.034),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "لديك حساب ! ",
                      style: Theme.of(context).textTheme.subtitle1!.copyWith(
                          color: const Color.fromARGB(255, 65, 73, 75)),
                    ),
                    CupertinoButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        Navigator.of(context).pushNamedAndRemoveUntil(
                            Login.id, (route) => false);
                      },
                      child: Text(
                        "تسجيل الدخول",
                        style: Theme.of(context)
                            .textTheme
                            .subtitle1!
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
