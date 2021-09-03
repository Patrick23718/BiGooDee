import 'package:bigoodee/constants.dart';
import 'package:bigoodee/enums.dart';
import 'package:bigoodee/helpers/customNavBarClient.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 100,
          centerTitle: true,
          title: Text(
            'Paramètres',
            style: headingStyle,
            textAlign: TextAlign.center,
            maxLines: 2,
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
        bottomNavigationBar:
            CustomBottomNavBarClient(selectedMenu: MenuState.profile),
        body: SingleChildScrollView(
            // keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            child: Padding(
          padding: EdgeInsets.only(
              top: 0, left: 10, bottom: defaultPadding, right: 10),
          child: Column(
            children: [
              Parametre(
                text: "Moyen de paiement",
                onpress: () {
                  Get.toNamed('/cliente/paiement');
                },
              ),
              SizedBox(
                height: 15,
              ),
              Parametre(
                text: "Gestion du mot de passe",
                onpress: () {
                  Get.toNamed("/cliente/passmanege");
                },
              ),
              SizedBox(
                height: 15,
              ),
              Parametre(
                text: "Mes coiffeuses préférées",
                onpress: () {
                  Get.toNamed("/client/whistlist");
                },
              ),
              SizedBox(
                height: 15,
              ),
              Parametre(
                text: "Supprimer un compte",
                onpress: () {
                  Get.defaultDialog(
                      titlePadding: EdgeInsets.all(0),
                      title: '',
                      middleText:
                          'souhaitez-vous supprimer définitivement votre compte?',
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
                              onPressed: () {
                                Get.back();
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
                              },
                            ),
                          ),
                        ),
                      ]);
                },
              ),
              SizedBox(
                height: 15,
              ),
              Parametre(
                text: "CGU",
                onpress: () {
                  Get.toNamed('/cliente/cgu');
                },
              )
            ],
          ),
        )));
  }
}

class Parametre extends StatelessWidget {
  final String text;
  final void Function() onpress;
  const Parametre({Key? key, required this.text, required this.onpress})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width / 12;
    return InkWell(
      onTap: onpress,
      child: Container(
        width: double.infinity,
        // width: width * 9,
        // decoration: BoxDecoration(

        // ),
        padding: EdgeInsets.only(right: 10),
        decoration: BoxDecoration(
          color: kSecondaryColor,
          border: Border.all(color: kborderColor),
          borderRadius: BorderRadius.circular(10),
          // border: Border(left: BorderSide(color: kWarAlertColor, width: 8)),
          // borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 5),
              width: 10,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10.0),
                    bottomLeft: Radius.circular(10.0)),
                color: kWarAlertColor,
              ),
              child: SizedBox(
                height: 40,
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    // width: width * 7,
                    child: Text(
                      this.text,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: TextStyle(
                        fontSize:
                            textRegularH3, //getProportionateScreenWidth(28),
                        color: kTextColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 5,
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
    );
  }
}
