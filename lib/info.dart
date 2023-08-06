// ignore_for_file: library_private_types_in_public_api, empty_statements


import 'package:flutter/material.dart';
import 'app_style.dart';

class MyInfo extends StatefulWidget {
  const MyInfo({Key? key}) : super(key: key);

  @override
  _MyInfoState createState() => _MyInfoState();
}

class _MyInfoState extends State<MyInfo> {
  String name = '';
  String genre = '';
  String age = '';
  String role = '';
  List<String> genres = ['ذكر', 'انثى'];
  List<String> roles = ['تلميذ', 'ولي'];
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _navigateToNextPage() {
    if (_formKey.currentState!.validate()) {
      // All fields are filled, navigate to next page
      Navigator.pushNamed(context, 'time');
    
      
    } else {
      // Display notification if any fields are empty
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('من فضلك املأ جميع الحقول'),
        ),
      );
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
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(),
                        TextFormField(
                          onChanged: (value) {
                            setState(() {
                              name = value;
                            });
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'من فضلك املأ الحقل';
                            }
                            return null;
                          },
                          style: const TextStyle(
                            color: Colors.black, // Set text color to black
                          ),
                          textAlign: TextAlign.right, // Align text to the right
                          decoration: InputDecoration(
                            hintText: 'الاسم',
                            alignLabelWithHint: true, // Align label with hint
                            labelStyle: const TextStyle(
                              color:
                                  Colors.black, // Set label text color to black
                              fontSize: 16, // Adjust label font size as needed
                              fontWeight: FontWeight
                                  .bold, // Adjust label font weight as needed
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                color: Colors.black,
                              ),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: 16, // Adjust vertical padding as needed
                              horizontal:
                                  12, // Adjust horizontal padding as needed
                            ),
                          ),
                        ),
                        const SizedBox(height: 40.0),
                        Directionality(
                          textDirection: TextDirection
                              .rtl, // Set text direction to right-to-left
                          child: DropdownButtonFormField(
                            value: genre.isNotEmpty && genres.contains(genre)
                                ? genre
                                : null,
                            items: genres.map((String value) {
                              return DropdownMenuItem(
                                value: value,
                                child: Text(
                                  value,
                                  style: const TextStyle(
                                      color: Colors
                                          .black), // Set text color to black
                                ),
                              );
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                genre = value as String;
                              });
                            },
                            validator: (value) {
                              if (value == null) {
                                return 'من فضلك اختر الجنس';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              labelText: 'الجنس',
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 40.0),
                        TextFormField(
                          onChanged: (value) {
                            setState(() {
                              age = value;
                            });
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'من فضلك املأ الحقل';
                            }
                            return null;
                          },
                          style: const TextStyle(
                            color: Colors.black, // Set text color to black
                          ),
                          textAlign: TextAlign.right, // Align text to the right
                          decoration: InputDecoration(
                            hintText: 'العمر',
                            alignLabelWithHint: true, // Align label with hint
                            labelStyle: const TextStyle(
                              color:
                                  Colors.black, // Set label text color to black
                              fontSize: 16, // Adjust label font size as needed
                              fontWeight: FontWeight
                                  .bold, // Adjust label font weight as needed
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                color: Colors.black,
                              ),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: 16, // Adjust vertical padding as needed
                              horizontal:
                                  12, // Adjust horizontal padding as needed
                            ),
                          ),
                        ),
                        const SizedBox(height: 40),
                        Directionality(
                          textDirection: TextDirection
                              .rtl, // Set text direction to right-to-left
                          child: DropdownButtonFormField(
                            value: role.isNotEmpty && roles.contains(role)
                                ? role
                                : null,
                            items: roles.map((String value) {
                              return DropdownMenuItem(
                                value: value,
                                child: Text(
                                  value,
                                  style: const TextStyle(
                                      color: Colors
                                          .black), // Set text color to black
                                ),
                              );
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                role = value as String;
                              });
                            },
                            validator: (value) {
                              if (value == null) {
                                return 'من فضلك اختر الصفة';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              labelText: 'الصفة',
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 100),
                        CircleAvatar(
                          radius: 30,
                          backgroundColor: const Color(0xff4c505b),
                          child: IconButton(
                            color: Colors.white,
                            onPressed: _navigateToNextPage,
                            icon: const Icon(
                              Icons.arrow_forward,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
