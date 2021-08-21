import 'dart:ui';

import 'package:bigoodee/constants.dart';
import 'package:bigoodee/enums.dart';
import 'package:bigoodee/helpers/coustom_bottom_nav_bar.dart';
import 'package:bigoodee/services/userServices.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class AccueilCoffeuse extends StatefulWidget {
  @override
  _AccueilCoffeuseState createState() => _AccueilCoffeuseState();
}

class _AccueilCoffeuseState extends State<AccueilCoffeuse> {
  UserServices _userServices = UserServices();

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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Stack(
              clipBehavior: Clip.none,
              children: <Widget>[
                Container(
                  color: kbackColor,
                  height: 120,
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
                            image: DecorationImage(
                              image: AssetImage('images/profile.png'),
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                    )))
              ],
            ),
            SizedBox(
              height: 60,
            ),
            Center(
              child: Text(
                'Bonjour ${user!.displayName!.split('%')[1].split(' ')[0]},',
                style: headingStyle,
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Center(
              child: Wrap(
                spacing: 5,
                runSpacing: 10,
                children: [
                  Container(
                    width: height * 2.2,
                    height: height * 2.5,
                    // padding: EdgeInsets.symmetric(horizontal: 10),
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
                  ),
                  Container(
                    width: height * 2.2,
                    height: height * 2.5,
                    // padding: EdgeInsets.symmetric(horizontal: 10),
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
                  ),
                  Container(
                    width: height * 2.2,
                    height: height * 2.5,
                    // padding: EdgeInsets.symmetric(horizontal: 10),
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
                  ),
                  Container(
                    width: height * 2.2,
                    height: height * 2.5,
                    // padding: EdgeInsets.symmetric(horizontal: 10),
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
                  ),
                  Container(
                    width: height * 2.2,
                    height: height * 2.5,
                    // padding: EdgeInsets.symmetric(horizontal: 10),
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
                  ),
                  Container(
                    width: height * 2.2,
                    height: height * 2.5,
                    // padding: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                        color: kSecondaryColor,
                        borderRadius: BorderRadius.circular(4),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 1,
                            blurRadius: 1,
                            offset: Offset(0, 1),
                          )
                        ]),
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
                  ),
                ],
              ),
            ),
            SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(width: 15),
                SvgPicture.asset('icons/bell_alert.svg'),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'tu as une réservation',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                  ),
                )
              ],
            ),
            SizedBox(height: 15),
            InkWell(
              onTap: () {
                Get.defaultDialog(
                    title: 'notification',
                    content: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          border:
                              Border.all(color: Colors.grey.withOpacity(0.5))
                          // boxShadow: [
                          //   BoxShadow(
                          //     color: Colors.grey.withOpacity(0.5),
                          //     // spreadRadius: 2,
                          //     // blurRadius: 2,
                          //     // offset: Offset(0, 3),
                          //   )
                          // ]
                          ),
                      padding: EdgeInsets.all(width * 0.3),
                      margin: EdgeInsets.all(width * 0.4),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: double.infinity,
                            child: Row(
                              children: [
                                Image(
                                    width: width * 2,
                                    color: Colors.grey.withOpacity(0.5),
                                    image: AssetImage('images/profile.png')),
                                Column(
                                  children: [
                                    Text(
                                      'en attente',
                                      textAlign: TextAlign.right,
                                    ),
                                    Text(
                                      'Sabine',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: textRegularH2),
                                    ),
                                    Text(
                                      'Nattes collées',
                                      textAlign: TextAlign.left,
                                      style: normalStyle,
                                    ),
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ));
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 15),
                padding:
                    EdgeInsets.only(left: 8, right: 15, top: 10, bottom: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    border: Border.all(color: Colors.grey.withOpacity(0.5))
                    // boxShadow: [
                    //   BoxShadow(
                    //     color: Colors.grey.withOpacity(0.5),
                    //     // spreadRadius: 2,
                    //     // blurRadius: 2,
                    //     // offset: Offset(0, 3),
                    //   )
                    // ]
                    ),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                              backgroundImage:
                                  AssetImage('images/profile.png')),
                          SizedBox(
                            width: 15,
                          ),
                          Container(
                            width: width * 5,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: width * 3.6,
                                      child: Text(
                                        'Clarisse',
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                    Text(
                                      "40€",
                                      style: TextStyle(
                                          fontSize: 22, color: kWarAlertColor),
                                    )
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: width * 5,
                                      child: Text(
                                        'Vanilles (twists) effet',
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                        style: normalStyle,
                                        // textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      SvgPicture.asset('icons/message.svg'),
                    ]),
              ),
            )
            // Container(
            //   padding: EdgeInsets.symmetric(vertical: 10),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       Row(
            //         // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //         children: [
            //           CircleAvatar(
            //               backgroundImage: AssetImage('images/icon.png')),
            //           Container(
            //             // width: ,
            //             child: Column(
            //               children: [
            //                 Row(
            //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //                   children: [
            //                     Text(
            //                       'Clarisse',
            //                       style: subHeadingStyle,
            //                     ),
            //                     Text(
            //                       "40€",
            //                       style: TextStyle(
            //                           fontSize: 22, color: kWarAlertColor),
            //                     )
            //                   ],
            //                 ),
            //                 Text(
            //                   'Vanilles (twists) effet',
            //                   maxLines: 1,
            //                   style: normalStyle,
            //                   textAlign: TextAlign.center,
            //                 )
            //               ],
            //             ),
            //           ),
            //         ],
            //       ),
            //       SvgPicture.asset('icons/message.svg'),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
