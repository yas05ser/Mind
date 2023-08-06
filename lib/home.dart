// ignore_for_file: library_private_types_in_public_api, camel_case_types, unused_field


import 'package:flutter/material.dart';
import 'app_style.dart';
import 'components/coustom_bottom_nav_bar.dart';
import 'costume/nissyane.dart';
import 'costume/nissyane2.dart';
import 'enums.dart';



class tamrine extends StatefulWidget {
  const tamrine({super.key});

  @override
  State<tamrine> createState() => _tamrineState();
}

class _tamrineState extends State<tamrine> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const CustomBottomNavBar(selectedMenu:MenuState.home),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Image.asset(
              logoImage,
              height: 150,
              width: 150,
            ),
          ),
          const SizedBox(height: 80),
          Text(
            "اختر تمرين",
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 80),
          Expanded(
            child: Align(
              alignment: Alignment.center,
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                       Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ImageGamePage(),
                      ),
                    );
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.black,
                      minimumSize: const Size(400, 60),
                    ),
                    child: const Text('تمرين 01'),
                  ),
                  const SizedBox(height: 25),
                  ElevatedButton(
                    onPressed: () {
                       Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ChallengePage(),
                      ),
                    );
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.black,
                      backgroundColor: const Color.fromARGB(255, 139, 139, 139),
                      minimumSize: const Size(400, 60),
                    ),
                    child: const Text('تمرين 02'),
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
