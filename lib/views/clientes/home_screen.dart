import 'package:bigoodee/constants.dart';
import 'package:bigoodee/controllers/prestationController.dart';
import 'package:bigoodee/enums.dart';
import 'package:bigoodee/helpers/customNavBarClient.dart';
import 'package:bigoodee/models/Ville.dart';
import 'package:bigoodee/services/userServices.dart';
import 'package:bigoodee/services/villeServices.dart';
import 'package:bigoodee/views/coiffeuses/planning.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class HomeClient extends StatefulWidget {
  // const Home({ Key? key }) : super(key: key);
  @override
  _HomeClientState createState() => _HomeClientState();
}

class _HomeClientState extends State<HomeClient> {
  // final PrestationController productController =
  //     Get.put(PrestationController());
  UserServices _userServices = UserServices();
  late Future<Ville?> _ville;

  User? user;

  @override
  void initState() {
    // TODO: implement initState
    _ville = VilleService().getVille();
    // print(productController.prestationList[1]);
    super.initState();
    user = _userServices.getUser();
    // if (user == null) {
    //   Get.offAllNamed('/connexion');
    // }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width / 12;
    double height = MediaQuery.of(context).size.height / 13;
    return Scaffold(
      appBar: AppBar(
        leading: SizedBox(),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.notifications_outlined))
        ],
      ),
      bottomNavigationBar:
          CustomBottomNavBarClient(selectedMenu: MenuState.home),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                // height: height*3,
                color: kSecondaryColor,
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(
                        image: AssetImage('images/logos.png'),
                        height: 20,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Bonjour ${user!.displayName!.split('%')[0].split(' ')[0]},",
                        style: headingStyle,
                      ),
                      SizedBox(
                        height: 10,
                      )
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 11,
              child: Container(
                // height: height * 7,
                color: kPrimaryColor,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: Column(
                  children: [
                    Text(
                      "Découvrez et reservez la coiffeuse qui vous correspond !",
                      style: TextStyle(
                        fontSize:
                            textRegularP1, //getProportionateScreenWidth(28),
                        color: kSecondaryColor,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        // color: kSecondaryColor,
                        decoration: BoxDecoration(
                            color: kSecondaryColor,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Expanded(
                                      flex: 10,
                                      child: FlatButton(
                                        child: Text(
                                          'Je reserve ma coiffeuse',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: kSecondaryColor,
                                              fontSize: 12),
                                        ),
                                        color: kPrimaryColor,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        onPressed: () {},
                                      ),
                                    ),
                                    Expanded(
                                      child: SizedBox(),
                                    ),
                                    Expanded(
                                      flex: 10,
                                      child: FlatButton(
                                        child: Text(
                                          'Je découvre les coiffures',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: kSecondaryColor,
                                              fontSize: 12),
                                        ),
                                        color: kPrimaryColor.withOpacity(0.5),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        onPressed: () {},
                                      ),
                                    ),
                                  ]),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(13.0),
                              child: SingleChildScrollView(
                                child: Container(
                                  width: double.infinity,
                                  child: Column(
                                    children: [
                                      Container(
                                        // height: width * 1.8,
                                        width: double.infinity,
                                        // margin: EdgeInsets.only(left: 10, right: 10),
                                        height: 50,
                                        decoration: BoxDecoration(
                                          border:
                                              Border.all(color: kTextOnlyColor),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: InkWell(
                                          onTap: () {
                                            Get.defaultDialog(
                                                title: '',
                                                titlePadding: EdgeInsets.all(0),
                                                content: Column(
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        SizedBox(
                                                          width: 20,
                                                        ),
                                                        Text(
                                                          'Choisissez votre ville',
                                                          style: TextStyle(
                                                              fontSize:
                                                                  textRegularH2,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500),
                                                        ),
                                                        IconButton(
                                                          onPressed: () =>
                                                              Get.back(),
                                                          icon: SvgPicture.asset(
                                                              'icons/close.svg'),
                                                        )
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 20,
                                                    ),
                                                    InputPrestation(
                                                      text: 'Nantes',
                                                      icon: 'icons/build.svg',
                                                    ),
                                                    SizedBox(
                                                      height: inputInterligne,
                                                    ),
                                                    InputPrestation(
                                                      text: 'Rennes',
                                                      icon: 'icons/build.svg',
                                                    ),
                                                    SizedBox(
                                                      height: inputInterligne,
                                                    ),
                                                    InputPrestation(
                                                        text: 'Lille',
                                                        icon:
                                                            'icons/build.svg'),
                                                    SizedBox(
                                                      height: inputInterligne,
                                                    ),
                                                    InputPrestation(
                                                        text: 'Bordeaux',
                                                        icon:
                                                            'icons/build.svg'),
                                                    SizedBox(
                                                      height: inputInterligne,
                                                    ),
                                                    Text(
                                                      'si votre ville ne fait pas partie des villes proposées, n\'hésitez pas à proposer votre ville en suggestion',
                                                      style: normalStyle,
                                                    ),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets
                                                              .symmetric(
                                                          vertical: 10),
                                                      child: SizedBox(
                                                        width: double.infinity,
                                                        height: buttonHeight,
                                                        child: FlatButton(
                                                          child: Text(
                                                            'valider'
                                                                .toUpperCase(),
                                                            style: TextStyle(
                                                                color:
                                                                    kSecondaryColor,
                                                                fontSize: 16),
                                                          ),
                                                          color: kPrimaryColor,
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
                                                          ),
                                                          onPressed: () {
                                                            Get.back();
                                                            //  Navigator.push(context, MaterialPageRoute(builder: (context) => Acceuil()));
                                                          },
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ));
                                          },
                                          highlightColor:
                                              kPrimaryColor.withOpacity(0.2),
                                          child: Container(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 10),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  children: <Widget>[
                                                    SvgPicture.asset(
                                                        'icons/map.svg'),
                                                    SizedBox(
                                                      width: 15,
                                                    ),
                                                    Text(
                                                      'Choix de la ville',
                                                      style: TextStyle(
                                                        fontSize: textRegularP1,
                                                        color: kTextOnlyColor,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Container(
                                                    // padding: ,
                                                    child: SvgPicture.asset(
                                                        'icons/Vector.svg'))
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                      Container(
                                        // height: width * 1.8,
                                        width: double.infinity,
                                        // margin: EdgeInsets.only(left: 10, right: 10),
                                        height: 50,
                                        decoration: BoxDecoration(
                                          border:
                                              Border.all(color: kTextOnlyColor),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: InkWell(
                                          onTap: () {
                                            Get.defaultDialog(
                                                title: '',
                                                titlePadding: EdgeInsets.all(0),
                                                content: Column(
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        SizedBox(
                                                          width: 20,
                                                        ),
                                                        Text(
                                                          'Type de prestation',
                                                          style: TextStyle(
                                                              fontSize:
                                                                  textRegularH2,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500),
                                                        ),
                                                        IconButton(
                                                          onPressed: () =>
                                                              Get.back(),
                                                          icon: SvgPicture.asset(
                                                              'icons/close.svg'),
                                                        )
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 20,
                                                    ),
                                                    InputPrestation(
                                                      text: 'FULANI BRAIDS',
                                                    ),
                                                    SizedBox(
                                                      height: inputInterligne,
                                                    ),
                                                    InputPrestation(
                                                        text: 'VANILLES'),
                                                    SizedBox(
                                                      height: inputInterligne,
                                                    ),
                                                    InputPrestation(
                                                        text: 'CORNROWS'),
                                                    SizedBox(
                                                      height: inputInterligne,
                                                    ),
                                                    InputPrestation(
                                                        text: 'BANTU KNOTS'),
                                                    SizedBox(
                                                      height: inputInterligne,
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets
                                                              .symmetric(
                                                          vertical: 10),
                                                      child: SizedBox(
                                                        width: double.infinity,
                                                        height: buttonHeight,
                                                        child: FlatButton(
                                                          child: Text(
                                                            'valider'
                                                                .toUpperCase(),
                                                            style: TextStyle(
                                                                color:
                                                                    kSecondaryColor,
                                                                fontSize: 16),
                                                          ),
                                                          color: kPrimaryColor,
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
                                                          ),
                                                          onPressed: () {
                                                            Get.back();
                                                            //  Navigator.push(context, MaterialPageRoute(builder: (context) => Acceuil()));
                                                          },
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ));
                                          },
                                          highlightColor:
                                              kPrimaryColor.withOpacity(0.2),
                                          child: Container(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 10),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  children: <Widget>[
                                                    SvgPicture.asset(
                                                      'icons/hair.svg',
                                                      width: 20,
                                                    ),
                                                    SizedBox(
                                                      width: 15,
                                                    ),
                                                    Text(
                                                      'Type de prestation',
                                                      style: TextStyle(
                                                        fontSize: textRegularP1,
                                                        color: kTextOnlyColor,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Container(
                                                    // padding: ,
                                                    child: SvgPicture.asset(
                                                        'icons/Vector.svg'))
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        // height: width * 1.8,
                                        width: double.infinity,
                                        // margin: EdgeInsets.only(left: 10, right: 10),
                                        height: 50,
                                        decoration: BoxDecoration(
                                          border:
                                              Border.all(color: kTextOnlyColor),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: InkWell(
                                          onTap: () {
                                            Get.defaultDialog(
                                                title: 'Choix de la date',
                                                // titlePadding:
                                                //     EdgeInsets.all(10),
                                                content: SingleChildScrollView(
                                                  child: Column(
                                                    children: [
                                                      ReservationCalendar(),

                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .symmetric(
                                                                horizontal:
                                                                    30.0),
                                                        child: Divider(
                                                            thickness: 1.5),
                                                      ),
                                                      // SizedBox(
                                                      //   height: inputInterligne,
                                                      // ),
                                                      Text(
                                                        'choisis ta plage horaire',
                                                        style: normalStyle,
                                                      ),
                                                      Wrap(
                                                        spacing: 5,
                                                        runSpacing: 5,
                                                        children: [
                                                          RaisedButton(
                                                            onPressed: () {
                                                              Get.back();
                                                            },
                                                            child: Text(
                                                              '08h:00 - 10h:00',
                                                              style:
                                                                  normalStyle,
                                                            ),
                                                          ),
                                                          RaisedButton(
                                                            onPressed: () {
                                                              Get.back();
                                                            },
                                                            child: Text(
                                                              '08h:00 - 10h:00',
                                                              style:
                                                                  normalStyle,
                                                            ),
                                                          ),
                                                        ],
                                                      ),

                                                      // Row(
                                                      //   mainAxisAlignment:
                                                      //       MainAxisAlignment
                                                      //           .spaceBetween,
                                                      //   children: [
                                                      //     SizedBox(
                                                      //       width: 20,
                                                      //     ),
                                                      //     Text(
                                                      //       'Type de prestation',
                                                      //       style: TextStyle(
                                                      //           fontSize:
                                                      //               textRegularH2,
                                                      //           fontWeight:
                                                      //               FontWeight
                                                      //                   .w500),
                                                      //     ),
                                                      //     IconButton(
                                                      //       onPressed: () =>
                                                      //           Get.back(),
                                                      //       icon: SvgPicture.asset(
                                                      //           'icons/close.svg'),
                                                      //     )
                                                      //   ],
                                                      // ),
                                                      // SizedBox(
                                                      //   height: 20,
                                                      // ),
                                                      // InputPrestation(
                                                      //   text: 'Braids',
                                                      // ),
                                                      // SizedBox(
                                                      //   height: inputInterligne,
                                                      // ),
                                                      // InputPrestation(
                                                      //     text:
                                                      //         'Vanilles (twists)'),
                                                      // SizedBox(
                                                      //   height: inputInterligne,
                                                      // ),
                                                      // InputPrestation(
                                                      //     text: 'Tissages'),
                                                      // SizedBox(
                                                      //   height: inputInterligne,
                                                      // ),
                                                      // InputPrestation(
                                                      //     text: 'Nattes colléss'),
                                                      // SizedBox(
                                                      //   height: inputInterligne,
                                                      // ),
                                                      // Padding(
                                                      //   padding: const EdgeInsets
                                                      //           .symmetric(
                                                      //       vertical: 10),
                                                      //   child: SizedBox(
                                                      //     width: double.infinity,
                                                      //     height: buttonHeight,
                                                      //     child: FlatButton(
                                                      //       child: Text(
                                                      //         'valider'
                                                      //             .toUpperCase(),
                                                      //         style: TextStyle(
                                                      //             color:
                                                      //                 kSecondaryColor,
                                                      //             fontSize: 16),
                                                      //       ),
                                                      //       color: kPrimaryColor,
                                                      //       shape:
                                                      //           RoundedRectangleBorder(
                                                      //         borderRadius:
                                                      //             BorderRadius
                                                      //                 .circular(
                                                      //                     10),
                                                      //       ),
                                                      //       onPressed: () {
                                                      //         Get.back();
                                                      //         //  Navigator.push(context, MaterialPageRoute(builder: (context) => Acceuil()));
                                                      //       },
                                                      //     ),
                                                      //   ),
                                                      // ),
                                                    ],
                                                  ),
                                                ));
                                          },
                                          highlightColor:
                                              kPrimaryColor.withOpacity(0.2),
                                          child: Container(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 10),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  children: <Widget>[
                                                    SvgPicture.asset(
                                                      'icons/calandar.svg',
                                                      width: 20,
                                                    ),
                                                    SizedBox(
                                                      width: 15,
                                                    ),
                                                    Text(
                                                      'Choix de votre date',
                                                      style: TextStyle(
                                                        fontSize: textRegularP1,
                                                        color: kTextOnlyColor,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Container(
                                                    // padding: ,
                                                    child: SvgPicture.asset(
                                                        'icons/Vector.svg'))
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 10),
                                        child: Center(
                                          child: SizedBox(
                                            width: double.infinity,
                                            height: buttonHeight,
                                            child: FlatButton(
                                              child: Text(
                                                'rechercher'.toUpperCase(),
                                                style: TextStyle(
                                                    color: kSecondaryColor,
                                                    fontSize: 16),
                                              ),
                                              color: kPrimaryColor,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              onPressed: () {},
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  // child: Wrap(
                                  //   alignment: WrapAlignment.spaceAround,
                                  //   children: [
                                  //     // Column(
                                  //     //   children: [

                                  //     //     Image.asset('assets/images/coiffeuse_1.png', height: double.infinity/1.7, fit: BoxFit.contain,)
                                  //     //   ],
                                  //     // ),
                                  //     Text("data je suis"),
                                  //     Text("data je suis"),
                                  //     Text("data je suis"),
                                  //     Text("data je suis"),
                                  //     Text("data je suis"),
                                  //     Text("data je suis"),
                                  //     Text("data je suis"),
                                  //   ],
                                  // ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class InputPrestation extends StatelessWidget {
  final String text;

  final String? icon;

  const InputPrestation({Key? key, required this.text, this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var check = false.obs;
    double width = MediaQuery.of(context).size.width / 12;
    return Obx(() => InkWell(
          onTap: () {
            check.value = !check.value;
          },
          child: Container(
            // height: width * 1.8,
            width: width * 12,
            // margin: EdgeInsets.only(left: 10, right: 10),
            height: 50,
            decoration: BoxDecoration(
              border: Border.all(
                  color: (check.value) ? kPrimaryColor : kTextOnlyColor),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: <Widget>[
                          icon != null
                              ? SvgPicture.asset(
                                  icon!,
                                  color: (check.value) ? kPrimaryColor : null,
                                )
                              : SvgPicture.asset(
                                  "icons/hair.svg",
                                  color: (check.value) ? kPrimaryColor : null,
                                ),
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            text,
                            style: TextStyle(
                              fontSize: textRegularP1,
                              color: kTextOnlyColor,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        // padding: ,
                        child: SvgPicture.asset((check.value)
                            ? 'icons/check.svg'
                            : 'icons/uncheck.svg'),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}

class TypePrestation extends StatelessWidget {
  final String text;
  final String icon;

  const TypePrestation({Key? key, required this.text, required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var check = false.obs;
    double width = MediaQuery.of(context).size.width / 12;
    return Obx(() => InkWell(
          onTap: () {
            check.value = !check.value;
          },
          child: Container(
            // height: width * 1.8,
            width: width * 12,
            // margin: EdgeInsets.only(left: 10, right: 10),
            height: 50,
            decoration: BoxDecoration(
              border: Border.all(
                  color: (check.value) ? kPrimaryColor : kTextOnlyColor),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: <Widget>[
                      SvgPicture.asset(
                        'icons/hair.svg',
                        color: (check.value) ? kPrimaryColor : null,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        text,
                        style: TextStyle(
                          fontSize: textRegularP1,
                          color: kTextOnlyColor,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    // padding: ,
                    child: SvgPicture.asset((check.value)
                        ? 'icons/check.svg'
                        : 'icons/uncheck.svg'),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
