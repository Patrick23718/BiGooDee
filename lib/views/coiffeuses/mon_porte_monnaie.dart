import 'package:bigoodee/constants.dart';
import 'package:bigoodee/enums.dart';
import 'package:bigoodee/helpers/coustom_bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class PorteMonnaieScreen extends StatelessWidget {
  const PorteMonnaieScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 80,
          centerTitle: true,
          title: Text(
            'Mon Porte-monnaie',
            style: headingStyle,
          ),
          leading: IconButton(
            icon: SvgPicture.asset('icons/back.svg'),
            onPressed: () {
              Get.back();
              // Navigator.of(context).pop();
            },
          ),
          backgroundColor: Colors.transparent,
          bottomOpacity: 0,
          elevation: 0,
        ),
        bottomNavigationBar: CustomBottomNavBar(
          selectedMenu: MenuState.planning,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Cette Semaine',
                  style: TextStyle(
                    fontSize: textRegularH2,
                  ),
                ),
                SizedBox(height: 15),
                CustomButton(
                  text: '65€',
                  onpress: () => null,
                ),
                SizedBox(height: 5),
                Text(
                  'Ce mois-ci',
                  style: TextStyle(
                    fontSize: textRegularH2,
                  ),
                ),
                SizedBox(height: 15),
                CustomButton(
                  text: '450€',
                  onpress: () => null,
                ),
                SizedBox(height: 5),
                Text(
                  'Cette année',
                  style: TextStyle(
                    fontSize: textRegularH2,
                  ),
                ),
                SizedBox(height: 15),
                CustomButton(
                  text: '1500€',
                  onpress: () => null,
                ),
                SizedBox(height: 5),
                Text(
                  'En attente de virement',
                  style: TextStyle(
                    fontSize: textRegularH2,
                  ),
                ),
                SizedBox(height: 15),
                CustomButton(
                  text: '35€',
                  onpress: () => null,
                ),
              ],
            ),
          ),
        ));
  }
}

class CustomButton extends StatelessWidget {
  final VoidCallback onpress;

  final String text;

  const CustomButton({Key? key, required this.text, required this.onpress})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: SizedBox(
        width: double.infinity,
        height: buttonHeight,
        child: FlatButton(
          child: Text(
            text,
            style: TextStyle(color: kSecondaryColor, fontSize: 24),
          ),
          color: kPrimaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          onPressed: onpress,
        ),
      ),
    );
  }
}
