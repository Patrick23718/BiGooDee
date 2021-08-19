import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
// import 'package:flutter_swb_app/screens/home/home_screen.dart';
// import 'package:flutter_swb_app/screens/profile/profile_screen.dart';
// import 'package:flutter_swb_app/screens/sign_in/sign_in_screen.dart';
// import 'package:localstorage/localstorage.dart';

import '../constants.dart';
import '../enums.dart';

// ignore: must_be_immutable
class CustomBottomNavBar extends StatelessWidget {
  var token = '';

  CustomBottomNavBar({
    Key? key,
    required this.selectedMenu,
  }) : super(key: key);

  final MenuState selectedMenu;
  // final LocalStorage storage = new LocalStorage('access_token');
  // UserServices _userServices = UserServices();

  @override
  Widget build(BuildContext context) {
    final Color inActiveIconColor = kPrimaryColor;
    return Container(
      padding: EdgeInsets.symmetric(vertical: 1),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -15),
            blurRadius: 20,
            color: Color(0xFFDADADA).withOpacity(0.15),
          ),
        ],
        borderRadius: BorderRadius.only(
            // topLeft: Radius.circular(40),
            // topRight: Radius.circular(40),
            ),
      ),
      child: SafeArea(
          top: false,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: SvgPicture.asset(
                  "icons/Acceuil.svg",
                  color: MenuState.home == selectedMenu ? kPrimaryColor : null,
                ),
                onPressed: () {
                  Get.offNamed('/coiffeuse/home');
                  //Navigator.pushNamed(context, SignInScreen.routeName);
                },
              ),
              IconButton(
                  icon: SvgPicture.asset(
                    "icons/calendar.svg",
                    color: MenuState.planning == selectedMenu
                        ? kPrimaryColor
                        : null,
                  ),
                  onPressed: () => {
                        Get.toNamed('/coiffeuse/planning'),
                        // token = storage.getItem('token'),
                        // if(token == ""){
                        //   Navigator.pushNamed(context, SignInScreen.routeName),
                        // }else{
                        //   Navigator.pushNamed(context, ProfileScreen.routeName),
                        // },
                      }),
              IconButton(
                icon: SvgPicture.asset(
                  "icons/tchat.svg",
                  color:
                      MenuState.message == selectedMenu ? kPrimaryColor : null,
                ),
                onPressed: () {
                  Get.offNamed('/coiffeuse/message');
                  //Navigator.pushNamed(context, SignInScreen.routeName);
                },
              ),
              IconButton(
                  icon: SvgPicture.asset(
                    "icons/profile.svg",
                    color: MenuState.profile == selectedMenu
                        ? kPrimaryColor
                        : null,
                  ),
                  onPressed: () => {
                        Get.toNamed('/coiffeuse/profile'),
                      }),
            ],
          )),
    );
  }
}
