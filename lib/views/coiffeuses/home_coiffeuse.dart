import 'dart:ui';

import 'package:bigoodee/constants.dart';
import 'package:bigoodee/enums.dart';
import 'package:bigoodee/helpers/coustom_bottom_nav_bar.dart';
import 'package:bigoodee/services/galerieServices.dart';
import 'package:bigoodee/services/userServices.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AccueilCoffeuse extends StatefulWidget {
  @override
  _AccueilCoffeuseState createState() => _AccueilCoffeuseState();
}

class _AccueilCoffeuseState extends State<AccueilCoffeuse> {
  UserServices _userServices = UserServices();
  GalerieService _galerieService = GalerieService();

  User? user;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    user = _userServices.getUser();
    // if (user == null) {
    //   Get.offAllNamed('/connexion');
    // }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width / 12;
    double height = MediaQuery.of(context).size.height / 12;
    return Scaffold(
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.home),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              InkWell(
                onTap: () {
                  Get.bottomSheet(
                      Container(
                        child: Wrap(children: [
                          ListTile(
                            leading: Icon(Icons.camera_alt_outlined),
                            title: Text(
                              'Appareil Photo',
                              style: TextStyle(
                                fontSize:
                                    textRegularP1, //getProportionateScreenWidth(28),
                                color: kTextTitleColor,
                              ),
                            ),
                            onTap: () async {
                              var pickedFile = _galerieService.getImage(
                                  ImageSource.camera, user!.uid);
                            },
                          ),
                          ListTile(
                            leading: Icon(Icons.image),
                            title: Text(
                              'Galérie',
                              style: TextStyle(
                                fontSize:
                                    textRegularP1, //getProportionateScreenWidth(28),
                                color: kTextTitleColor,
                              ),
                            ),
                            onTap: () async {
                              var pickedFile = _galerieService.getImage(
                                  ImageSource.gallery, user!.uid);
                            },
                          )
                        ]),
                      ),
                      backgroundColor: kSecondaryColor);
                },
                child: Stack(
                  clipBehavior: Clip.none,
                  children: <Widget>[
                    Container(
                      color: kbackColor,
                      height: 90,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          FlatButton(
                              onPressed: () {
                                Get.toNamed('/coiffeuse/notifications');
                              },
                              child: SvgPicture.asset('icons/Bell.svg'))
                        ],
                      ),
                    ),
                    Positioned(
                        bottom: -50,
                        left: 0,
                        right: 0,
                        child: Center(
                            child: DottedBorder(
                          strokeWidth: 2,
                          padding: EdgeInsets.all(5),
                          color: kPrimaryColor,
                          borderType: BorderType.RRect,
                          radius: Radius.circular(8),
                          // padding: EdgeInsets.all(6),
                          child: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            child: Container(
                              width: width * 3.5,
                              height: width * 3.5,
                              // padding: EdgeInsets.all(17),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  // boxShadow: [
                                  //   BoxShadow(color: Colors.white, spreadRadius: 10)
                                  // ],
                                  image: user!.photoURL == null
                                      ? DecorationImage(
                                          image:
                                              AssetImage('images/profile.png'),
                                          fit: BoxFit.contain,
                                          scale: 5)
                                      : DecorationImage(
                                          image: NetworkImage(
                                              user!.photoURL.toString()),
                                          fit: BoxFit.contain,
                                          scale: 5)),
                            ),
                          ),
                        ))),
                    Positioned(
                        bottom: -60,
                        left: 0,
                        right: -100,
                        child: InkWell(
                          onTap: () {
                            print('object');
                          },
                          child: Center(
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: kPrimaryColor,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: SvgPicture.asset(
                                  'icons/appareil_photo.svg',
                                ),
                              ),
                            ),
                          ),
                        ))
                  ],
                ),
              ),
              SizedBox(
                height: 70,
              ),
              Center(
                child: Text(
                  'Bonjour ${user!.displayName!.split('%')[0].split(' ')[0]},',
                  style: headingStyle,
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  SizedBox(width: 5),
                  Expanded(
                      flex: 2,
                      child: Container(
                        height: 125,
                        child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              elevation: 1,
                              shadowColor: Colors.transparent,
                              side: BorderSide(
                                  color: kTextOnlyColor.withOpacity(0.2),
                                  width: 0.5,
                                  style: BorderStyle.solid),
                              primary: kPrimaryColor.withOpacity(0.2),
                            ),
                            onPressed: () {
                              Get.toNamed('/coiffeuse/portemonnaie');
                              // Navigator.push(context, MaterialPageRoute(builder: (context) => CreationCompteScreen()));
                            },
                            // color: Colors.transparent,
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 20),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SvgPicture.asset('icons/porte_monnaie.svg'),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "Mon porte-monnaie",
                                    style: normalStyle,
                                    textAlign: TextAlign.center,
                                  )
                                ],
                              ),
                            )),
                      )),
                  SizedBox(width: 5),
                  Expanded(
                      flex: 2,
                      child: Container(
                        height: 125,
                        child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              elevation: 1,
                              shadowColor: Colors.transparent,
                              side: BorderSide(
                                  color: kTextOnlyColor.withOpacity(0.2),
                                  width: 0.5,
                                  style: BorderStyle.solid),
                              primary: kPrimaryColor.withOpacity(0.2),
                            ),
                            onPressed: () {
                              // Navigator.push(context, MaterialPageRoute(builder: (context) => CreationCompteScreen()));
                            },
                            // color: Colors.transparent,
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 20),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SvgPicture.asset('icons/rendez_vous.svg'),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "Mes rendez-vous",
                                    style: normalStyle,
                                    textAlign: TextAlign.center,
                                  )
                                ],
                              ),
                            )),
                      )),
                  SizedBox(width: 5),
                  Expanded(
                      flex: 2,
                      child: Container(
                        height: 125,
                        child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              elevation: 1,
                              shadowColor: Colors.transparent,
                              side: BorderSide(
                                  color: kTextOnlyColor.withOpacity(0.2),
                                  width: 0.5,
                                  style: BorderStyle.solid),
                              primary: kPrimaryColor.withOpacity(0.2),
                            ),
                            onPressed: () {
                              Get.offNamed('/coiffeuse/message');
                              // Navigator.push(context, MaterialPageRoute(builder: (context) => CreationCompteScreen()));
                            },
                            // color: Colors.transparent,
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 20),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SvgPicture.asset('icons/discussions.svg'),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "Mes discussions",
                                    style: normalStyle,
                                    textAlign: TextAlign.center,
                                  )
                                ],
                              ),
                            )),
                      )),
                  SizedBox(width: 5)
                ],
              ),
              SizedBox(height: 5),
              Row(children: [
                SizedBox(width: 5),
                Expanded(
                    flex: 2,
                    child: Container(
                      height: 125,
                      child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            elevation: 1,
                            shadowColor: Colors.transparent,
                            side: BorderSide(
                                color: kTextOnlyColor.withOpacity(0.2),
                                width: 0.5,
                                style: BorderStyle.solid),
                            primary: kPrimaryColor.withOpacity(0.2),
                          ),
                          onPressed: () {
                            Get.toNamed('/coiffeuse/prestations');
                            // Navigator.push(context, MaterialPageRoute(builder: (context) => CreationCompteScreen()));
                          },
                          // color: Colors.transparent,
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SvgPicture.asset('icons/prestations.svg'),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "Mes prestations",
                                  style: normalStyle,
                                  textAlign: TextAlign.center,
                                )
                              ],
                            ),
                          )),
                    )),
                SizedBox(width: 5),
                Expanded(
                    flex: 2,
                    child: Container(
                      height: 125,
                      child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            elevation: 1,
                            shadowColor: Colors.transparent,
                            side: BorderSide(
                                color: kTextOnlyColor.withOpacity(0.2),
                                width: 0.5,
                                style: BorderStyle.solid),
                            primary: kPrimaryColor.withOpacity(0.2),
                          ),
                          onPressed: () {
                            // Navigator.push(context, MaterialPageRoute(builder: (context) => CreationCompteScreen()));
                            Get.toNamed('/coiffeuse/planning');
                          },
                          // color: Colors.transparent,
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SvgPicture.asset('icons/planning.svg'),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "Mon planning",
                                  style: normalStyle,
                                  textAlign: TextAlign.center,
                                )
                              ],
                            ),
                          )),
                    )),
                SizedBox(width: 5),
                Expanded(
                    flex: 2,
                    child: Container(
                      height: 125,
                      child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            elevation: 1,
                            shadowColor: Colors.transparent,
                            side: BorderSide(
                                color: kTextOnlyColor.withOpacity(0.2),
                                width: 0.5,
                                style: BorderStyle.solid),
                            primary: kPrimaryColor.withOpacity(0.2),
                          ),
                          onPressed: () {
                            Get.toNamed('/coiffeuse/profile');
                            // Navigator.push(context, MaterialPageRoute(builder: (context) => CreationCompteScreen()));
                          },
                          // color: Colors.transparent,
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SvgPicture.asset('icons/profil.svg'),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "Mon profil",
                                  style: normalStyle,
                                  textAlign: TextAlign.center,
                                )
                              ],
                            ),
                          )),
                    )),
                SizedBox(width: 5),
              ]),
              SizedBox(height: 5),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Center(
                  child: Column(
                    children: [
                      Text(
                        'Si vous n’avez pas encore rempli votre galerie photo. afin de valorisé votre profil, vous pouvez remplir celui-ci dans mon compte galerie.',
                        style: normalStyle,
                      ),
                      SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset('icons/sablie.svg'),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            'Profil en cours de validation',
                            style:
                                TextStyle(fontSize: 20, color: kWarAlertColor),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}

class Grid extends StatelessWidget {
  const Grid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(crossAxisCount: 3);
  }
}
