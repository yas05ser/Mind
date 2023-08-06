// ignore_for_file: camel_case_types, no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class profile extends StatefulWidget {
  const profile({super.key});

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  late String username;
  late String email;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
           Center(
            child: Text("email $email "),
          ),
            Center(
            child: Text("username $username "),
          ),
          ElevatedButton(
            onPressed: () async {
              await getData();
            },
            child: const Text(' get data'),
          ),
        ],
      ),
    );
  }

  getData() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    setState(() {
      _prefs.getString("email");
      _prefs.getString("username");
    });
  }
}
