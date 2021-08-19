import 'package:bigoodee/constants.dart';
import 'package:bigoodee/enums.dart';
import 'package:bigoodee/helpers/coustom_bottom_nav_bar.dart';
import 'package:bigoodee/services/userServices.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width / 12;
    double height = MediaQuery.of(context).size.height / 12;
    return Scaffold(
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.profile),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 22),
              width: double.infinity,
              height: height * 2.3,
              decoration: BoxDecoration(color: kbackColor),
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                          ),
                          child: Image(
                            image: AssetImage('images/profile.png'),
                          )),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Danielle',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w600),
                          ),
                          Container(
                            width: width * 6,
                            child: Text(
                              'danielle@gmail.com gfcdy tdfj ytf kytfd kytd ',
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: normalStyle,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: kPrimaryColor,
                    ),
                    child: Icon(Icons.arrow_forward_ios_rounded,
                        color: Colors.white),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: width * 1.8,
              width: double.infinity,
              margin: EdgeInsets.only(left: 10, right: 10),
              decoration: BoxDecoration(
                border: Border.all(color: kborderColor),
                borderRadius: BorderRadius.circular(10),
              ),
              child: InkWell(
                onTap: () {
                  print('ok');
                },
                highlightColor: kPrimaryColor.withOpacity(0.2),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: <Widget>[
                          SvgPicture.asset('icons/guide.svg'),
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            'Mon guide coiffeuse',
                            style: normalStyleText,
                          ),
                        ],
                      ),
                      Container(
                        height: 35,
                        width: 35,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: kPrimaryColor,
                        ),
                        child: Icon(
                          Icons.play_arrow_outlined,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: width * 1.8,
              width: double.infinity,
              margin: EdgeInsets.only(left: 10, right: 10),
              decoration: BoxDecoration(
                border: Border.all(color: kborderColor),
                borderRadius: BorderRadius.circular(10),
              ),
              child: InkWell(
                onTap: () {
                  Get.toNamed('/coiffeuse/prestations');
                },
                highlightColor: kPrimaryColor.withOpacity(0.2),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: <Widget>[
                          SvgPicture.asset('icons/prestationsicon.svg'),
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            'Mes prestations',
                            style: normalStyleText,
                          ),
                        ],
                      ),
                      Container(
                        height: 35,
                        width: 35,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: kPrimaryColor,
                        ),
                        child: Icon(
                          Icons.play_arrow_outlined,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: width * 1.8,
              width: double.infinity,
              margin: EdgeInsets.only(left: 10, right: 10),
              decoration: BoxDecoration(
                border: Border.all(color: kborderColor),
                borderRadius: BorderRadius.circular(10),
              ),
              child: InkWell(
                onTap: () {
                  Get.toNamed('/coiffeuse/galerie');
                },
                highlightColor: kPrimaryColor.withOpacity(0.2),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(children: <Widget>[
                        SvgPicture.asset('icons/galerie.svg'),
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          'Ma galerie',
                          style: normalStyleText,
                        ),
                      ]),
                      Container(
                        height: 35,
                        width: 35,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: kPrimaryColor,
                        ),
                        child: Icon(
                          Icons.play_arrow_outlined,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: width * 1.8,
              width: double.infinity,
              margin: EdgeInsets.only(left: 10, right: 10),
              decoration: BoxDecoration(
                border: Border.all(color: kborderColor),
                borderRadius: BorderRadius.circular(10),
              ),
              child: InkWell(
                onTap: () {
                  Get.toNamed('/coiffeuse/portemonnaie');
                },
                highlightColor: kPrimaryColor.withOpacity(0.2),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset('icons/monnaie.svg'),
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            'Mon porte monnaie',
                            style: normalStyleText,
                          ),
                        ],
                      ),
                      Container(
                        height: 35,
                        width: 35,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: kPrimaryColor,
                        ),
                        child: Icon(
                          Icons.play_arrow_outlined,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: width * 1.8,
              width: double.infinity,
              margin: EdgeInsets.only(left: 10, right: 10),
              decoration: BoxDecoration(
                border: Border.all(color: kborderColor),
                borderRadius: BorderRadius.circular(10),
              ),
              child: InkWell(
                onTap: () {
                  print('ok');
                },
                highlightColor: kPrimaryColor.withOpacity(0.2),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: <Widget>[
                          SvgPicture.asset('icons/historique.svg'),
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            'Mon historique',
                            style: normalStyleText,
                          ),
                        ],
                      ),
                      Container(
                        height: 35,
                        width: 35,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: kPrimaryColor,
                        ),
                        child: Icon(
                          Icons.play_arrow_outlined,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: width * 1.8,
              width: double.infinity,
              margin: EdgeInsets.only(left: 10, right: 10),
              decoration: BoxDecoration(
                border: Border.all(color: kborderColor),
                borderRadius: BorderRadius.circular(10),
              ),
              child: InkWell(
                onTap: () {
                  print('ok');
                },
                highlightColor: kPrimaryColor.withOpacity(0.2),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: <Widget>[
                          SvgPicture.asset('icons/contact.svg'),
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            'Nous contacter',
                            style: normalStyleText,
                          ),
                        ],
                      ),
                      Container(
                        height: 35,
                        width: 35,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: kPrimaryColor,
                        ),
                        child: Icon(
                          Icons.play_arrow_outlined,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: width * 1.8,
              width: double.infinity,
              margin: EdgeInsets.only(left: 10, right: 10),
              decoration: BoxDecoration(
                border: Border.all(color: kPrimaryColor),
                borderRadius: BorderRadius.circular(10),
              ),
              child: InkWell(
                onTap: () {
                  Get.defaultDialog(
                      titlePadding: EdgeInsets.all(0),
                      title: '',
                      middleText:
                          'Souhaitez-vous vous déconnecter de votre compte?',
                      actions: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: SizedBox(
                            height: buttonHeight,
                            child: OutlinedButton(
                              child: Text(
                                'CONFIRMER',
                                style: TextStyle(
                                    color: kPrimaryColor, fontSize: 16),
                              ),

                              style: OutlinedButton.styleFrom(
                                  side: BorderSide(
                                      width: 1, color: kPrimaryColor),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  )),

                              // color: kSecondaryColor,
                              // shape: RoundedRectangleBorder(
                              //   borderRadius: BorderRadius.circular(10),
                              // ),
                              onPressed: () {
                                UserServices().signOut();
                                Get.offNamed('/connexion');
                                //  Navigator.push(context, MaterialPageRoute(builder: (context) => Acceuil()));
                              },
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: SizedBox(
                            height: buttonHeight,
                            width: 130,
                            child: FlatButton(
                              child: Text(
                                'ANNULER',
                                style: TextStyle(
                                    color: kSecondaryColor, fontSize: 16),
                              ),
                              color: kPrimaryColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              onPressed: () {
                                Get.back();
                                //  Navigator.push(context, MaterialPageRoute(builder: (context) => Acceuil()));
                              },
                            ),
                          ),
                        ),
                      ]);
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: <Widget>[
                          SvgPicture.asset('icons/logout.svg'),
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            'SE DECONNECTER',
                            style: TextStyle(color: kPrimaryColor),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 50,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
