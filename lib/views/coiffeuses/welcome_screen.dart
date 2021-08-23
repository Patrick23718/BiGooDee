import 'package:bigoodee/constants.dart';
import 'package:bigoodee/services/userServices.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WelcomePageScreen extends StatefulWidget {
  const WelcomePageScreen({Key? key}) : super(key: key);

  @override
  _WelcomePageScreenState createState() => _WelcomePageScreenState();
}

class _WelcomePageScreenState extends State<WelcomePageScreen> {
  UserServices _userServices = UserServices();

  User? user;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    user = _userServices.getUser();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width / 12;
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: defaultPadding, vertical: defaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Bonjour ${user!.displayName!.split('%')[0].split(' ')[0]},",
                style: headingStyle,
              ),
              Image(
                image: AssetImage('images/succes.png'),
                height: width * 8,
              ),
              Text(
                "vos informations coiffeuse ont été soumis avec succès!",
                style: normalStyleText,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "votre profil va être validé le plus vite possible afin que vous puissiez profiter de votre nouvelle visibilité de coiffeuse Bigoodee. en attendant, découvrez votre espace personnalisé",
                style: normalStyleText,
                textAlign: TextAlign.justify,
              ),
              SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 0),
                child: SizedBox(
                  // height: 50,
                  width: double.infinity,
                  child: FlatButton(
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Text(
                          'ouvrir mon espace'.toUpperCase(),
                          style:
                              TextStyle(color: kSecondaryColor, fontSize: 16),
                        ),
                      ),
                      color: kPrimaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      onPressed: () {
                        Get.offAllNamed('/coiffeuse/home');
                        // Validate will return true if the form is valid, or false if
                        // the form is invalid.
                      }),
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
