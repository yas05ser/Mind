// ignore_for_file: camel_case_types, library_private_types_in_public_api, prefer_const_constructors

import 'package:flutter/material.dart';

import 'components/coustom_bottom_nav_bar.dart';
import 'enums.dart';
import 'home.dart';

class costume extends StatefulWidget {
  const costume({Key? key}) : super(key: key);

  @override
  _costumeState createState() => _costumeState();
}

class _costumeState extends State<costume> {
  int _selectedPageIndex = -1;

  void _onButtonTapped(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  void _navigateToNextPage([BuildContext? context]) {
    if (_selectedPageIndex >= 0 && _selectedPageIndex < 3) {
      switch (_selectedPageIndex) {
        case 0:
          Navigator.push(
            context!,
            MaterialPageRoute(
              builder: (context) => const tamrine(),
            ),
          );
          break;
        case 1:
          // Navigator.push(
          // context!,
          // MaterialPageRoute(
          //builder: (context) => const tamrine(),
          //  ),
          //  );
          break;
        case 2:
          //  Navigator.push(
          //  context!,
          //  MaterialPageRoute(
          //    builder: (context) => const tamrine(),
          //    ),
          //  );
          break;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      bottomNavigationBar: CustomBottomNavBar( selectedMenu: MenuState.home, ),
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
                    'assets/images/iconn.png', // استبدل بمسار الصورة الخاص بك
                    height: 150,
                    width: 150,
                  ),
                ),
                const SizedBox(height: 50.0),
                Text(
                  "لما تستعمل تطبيقنا!",
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(height: 80.0),
                ElevatedButton(
                  onPressed: () => _onButtonTapped(0),
                  style: ButtonStyle(
                    backgroundColor: _selectedPageIndex == 0
                        ? MaterialStateProperty.all<Color>(
                            const Color.fromARGB(255, 39, 187, 47))
                        : null,
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        side: const BorderSide(
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                    ),
                  ),
                  child: const Text(
                    'هل تعاني من النسيان',
                    style: TextStyle(
                      color: Color.fromARGB(255, 243, 241, 241),
                    ),
                  ),
                ),
                const SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () => _onButtonTapped(1),
                  style: ButtonStyle(
                    backgroundColor: _selectedPageIndex == 1
                        ? MaterialStateProperty.all<Color>(
                            const Color.fromARGB(255, 31, 127, 172))
                        : null,
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        side: const BorderSide(
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                    ),
                  ),
                  child: const Text(
                    'لديك نقص في التركيز',
                    style: TextStyle(
                      color: Color.fromARGB(255, 243, 241, 241),
                    ),
                  ),
                ),
                const SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () => _onButtonTapped(2),
                  style: ButtonStyle(
                    backgroundColor: _selectedPageIndex == 2
                        ? MaterialStateProperty.all<Color>(
                            const Color.fromARGB(255, 197, 186, 28))
                        : null,
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        side: const BorderSide(
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                    ),
                  ),
                  child: const Text(
                    'تعاني من القلق الدائم',
                    style: TextStyle(
                      color: Color.fromARGB(255, 243, 241, 241),
                    ),
                  ),
                ),
                const SizedBox(height: 100.0),
                ElevatedButton(
                  onPressed: _selectedPageIndex >= 0
                      ? () {
                          _navigateToNextPage(context);
                        }
                      : null,
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
