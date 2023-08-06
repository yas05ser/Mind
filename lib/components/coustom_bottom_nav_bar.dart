// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
//import 'package:shop_app/screens/home/home_screen.dart';
//import 'package:shop_app/screens/profile/profile_screen.dart';

//import '../constants.dart';
import '../constants.dart';
import '../costume.dart';
import '../enums.dart';
import '../profile/profile_screen.dart';

import '../quiz/screens/welcome/welcome_screen.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({
    Key? key,
    required this.selectedMenu,
  }) : super(key: key);

  final MenuState selectedMenu;
  


  @override
  Widget build(BuildContext context) {
    const Color inActiveIconColor = Color.fromARGB(255, 247, 247, 247);
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 0, 0, 0),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, -15),
            blurRadius: 20,
            color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.15),
          ),
        ],
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: SafeArea(
          top: false,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: SvgPicture.asset(
                  "assets/icons/User Icon.svg",
                  color: MenuState.home == selectedMenu
                      ? kPrimaryColor
                      : inActiveIconColor,
                ), 
                onPressed: () {  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const costume(),
                      ),
                    ); }
              ),
              IconButton(
                icon: SvgPicture.asset("assets/icons/User Icon.svg"),
                color: MenuState.favourite == selectedMenu
                      ? kPrimaryColor
                      : inActiveIconColor,
                onPressed: () {},
              ),
              IconButton(
                icon: SvgPicture.asset("assets/icons/User Icon.svg"),
                color: MenuState.message == selectedMenu
                      ? kPrimaryColor
                      : inActiveIconColor,
               onPressed: () {  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>  const WelcomeScreen(),
                      ),
                    ); },
              ),
              IconButton(
                icon: SvgPicture.asset(
                  "assets/icons/User Icon.svg",
                  color: MenuState.profile == selectedMenu
                      ? kPrimaryColor
                      : inActiveIconColor,
                ), onPressed: () {  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ProfileScreen(),
                      ),
                    ); },
               
                  
              ),
            ],
          )),
    );
  }
}
