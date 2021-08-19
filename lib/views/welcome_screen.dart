import 'package:bigoodee/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width / 12;
    double height = MediaQuery.of(context).size.height / 12;
    return Scaffold(
        appBar: AppBar(
            //title: Text('Hello'),
            backgroundColor: Colors.transparent,
            bottomOpacity: 0,
            elevation: 0,
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: kPrimaryColor,
              statusBarIconBrightness: Brightness.light,
            )),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: defaultPadding),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Créer mon compte",
                      // textAlign: TextAlign.center,
                      style: headingStyle,
                    ),
                  ],
                ),
                SizedBox(height: 60),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("Bienvenue chez Bigoodee !", style: subHeadingStyle),
                  ],
                ),
                SizedBox(height: titleInterligne),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Afin de vous orientez au mieux, dites-nous ce que vous souhaitez faire.",
                    textAlign: TextAlign.start,
                    style: normalStyle,
                  ),
                ),
                SizedBox(height: textInterligne),
                Row(
                  children: [
                    Expanded(
                      flex: 4,
                      child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            side: BorderSide(
                                color: kPrimaryColor.withOpacity(0.2),
                                width: 0.5,
                                style: BorderStyle.solid),
                            primary: kPrimaryColor.withOpacity(0.2),
                          ),
                          // style: ButtonStyle(

                          //   shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0))),
                          // ),
                          onPressed: () {
                            // Navigator.push(context, MaterialPageRoute(builder: (context) => CreationCompteScreen()));
                          },
                          // color: Colors.transparent,
                          child: Container(
                            // width: width * 3,
                            // height: width * 3,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: Column(
                                children: [
                                  Image(
                                    image: AssetImage('images/cliente.png'),
                                    height: width * 4,
                                  ),
                                  Text("Je veux etre coiffer",
                                      textAlign: TextAlign.center,
                                      style: normalStyle)
                                ],
                              ),
                            ),
                          )),
                    ),
                    Expanded(flex: 1, child: SizedBox()),
                    Expanded(
                      flex: 4,
                      child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            side: BorderSide(
                                color: kPrimaryColor.withOpacity(0.2),
                                width: 0.5,
                                style: BorderStyle.solid),
                            primary: kPrimaryColor.withOpacity(0.2),
                          ),
                          onPressed: () {
                            // Navigator.push(context, MaterialPageRoute(builder: (context) => CreationCompteScreen()));
                            Get.toNamed('/getstarted');
                          },
                          // color: Colors.transparent,
                          child: Container(
                            // width: width * 3,
                            // height: MediaQuery.of(context).size.width,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: Column(
                                children: [
                                  Image(
                                    image: AssetImage('images/coiffeuse.png'),
                                    height: width * 4,
                                  ),
                                  Text("Je veux coiffer",
                                      textAlign: TextAlign.center,
                                      style: normalStyle)
                                ],
                              ),
                            ),
                          )),
                    )
                  ],
                  // mainAxisAlignment: MainAxisAlignment.spaceAround,

                  // children: [
                  //   OutlinedButton(
                  //     style: ButtonStyle(
                  //       shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0))),
                  //     ),
                  //     onPressed: () {
                  //       Navigator.push(context, MaterialPageRoute(builder: (context) => CreationCompteScreen()));
                  //     },
                  //     // color: Colors.transparent,
                  //     child: Container(
                  //       width: width * 3,
                  //       height: width * 3,
                  //       child: Padding(
                  //         padding: const EdgeInsets.symmetric(vertical: 8),
                  //         child: Column(
                  //           children: [
                  //             Image(
                  //               image: AssetImage('assets/images/cliente.png'),
                  //               height: width * 3.3,
                  //             ),
                  //             // Text(
                  //             //   "Je veux etre coiffer",
                  //             //   textAlign: TextAlign.center,
                  //             //   style: TextStyle(
                  //             //     fontSize: textRegularP2,
                  //             //     fontWeight: FontWeight.w700,
                  //             //     color: kTextColor,
                  //             //   )
                  //             // )
                  //           ],
                  //         ),
                  //       ),
                  //     )
                  //   ),
                  //   OutlinedButton(
                  //     style: ButtonStyle(
                  //       shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0))),
                  //     ),
                  //     onPressed: () {},
                  //     // color: Colors.transparent,
                  //     child: Container(
                  //       width: width * 3,
                  //       height: width * 3,
                  //       child: Padding(
                  //         padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 0),
                  //         child: Column(
                  //           children: [
                  //             Image(
                  //               image: AssetImage('assets/images/coiffeuse.png'),
                  //               height: width * 3.15,
                  //             ),
                  //             SizedBox(height: 8),
                  //             // Text(
                  //             //   "Je veux coiffer",
                  //             //   textAlign: TextAlign.center,
                  //             //   style: TextStyle(
                  //             //     fontSize: textRegularP2,
                  //             //     fontWeight: FontWeight.w700,
                  //             //     color: kTextColor,
                  //             //   )
                  //             // )
                  //           ],
                  //         ),
                  //       ),
                  //     )
                  //   )
                  // ],
                ),
                SizedBox(height: 60),
              ],
            ),
          ),
        ));
  }
}
