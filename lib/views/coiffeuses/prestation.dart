import 'package:bigoodee/constants.dart';
import 'package:bigoodee/enums.dart';
import 'package:bigoodee/helpers/coustom_bottom_nav_bar.dart';
import 'package:bigoodee/views/coiffeuses/ajout_prestation.dart';
import 'package:bigoodee/views/coiffeuses/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class PrestationScreen extends StatelessWidget {
  final String? test;
  const PrestationScreen({Key? key, this.test}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width / 12;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        centerTitle: true,
        title: Text(
          'Mes prestations',
          style: headingStyle,
        ),
        leading: IconButton(
          icon: SvgPicture.asset('icons/back.svg'),
          onPressed: () {
            Get.back();
            // Navigator.of(context).pop();
          },
        ),
        actions: [
          test == "start"
              ? Text("")
              : IconButton(
                  onPressed: () {}, icon: SvgPicture.asset('icons/Bell.svg'))
        ],
        backgroundColor: Colors.transparent,
        bottomOpacity: 0,
        elevation: 0,
      ),
      bottomNavigationBar: test == "start"
          ? null
          : CustomBottomNavBar(
              selectedMenu: MenuState.planning,
            ),
      body: SingleChildScrollView(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            test == "start"
                ? Container(
                    width: double.infinity,
                    child: Text(
                      'étape 2/2',
                      textAlign: TextAlign.end,
                      style: normalStyleText,
                    ),
                  )
                : Text(''),
            SizedBox(height: 10),
            Text(
              'Vous pouvez ajouter une nouvelle prestation à tous moment.',
              style: normalStyleText,
            ),
            test == "start" ? SizedBox(height: 20) : Text(''),
            test == "start" ? SizedBox() : Prestation(),
            test == "start" ? SizedBox() : SizedBox(height: 10),
            test == "start" ? SizedBox() : Prestation(),
            test == "start" ? SizedBox() : SizedBox(height: 10),
            test == "start" ? SizedBox() : Prestation(),
            test == "start" ? SizedBox() : SizedBox(height: 10),
            test == "start" ? SizedBox() : Prestation(),
            test == "start" ? SizedBox() : SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: SizedBox(
                width: double.infinity,
                height: buttonHeight,
                child: FlatButton(
                  child: Text(
                    'Ajouter une prestation'.toUpperCase(),
                    style: TextStyle(color: kSecondaryColor, fontSize: 16),
                  ),
                  color: kPrimaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              AjoutPrestationScreen(test: test)),
                    );
                    Get.offNamed('/coiffeuse/addprestations');
                    //  Navigator.push(context, MaterialPageRoute(builder: (context) => Acceuil()));
                  },
                ),
              ),
            ),
            test == "start"
                ? Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: SizedBox(
                      width: width * 8,
                      child: FlatButton(
                          child: Text(
                            'continuer'.toUpperCase(),
                            style:
                                TextStyle(color: kSecondaryColor, fontSize: 16),
                          ),
                          color: kPrimaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => WelcomePageScreen()),
                            );
                            // Validate will return true if the form is valid, or false if
                            // the form is invalid.
                          }),
                    ),
                  )
                : Text('')
          ],
        ),
      )),
    );
  }
}

class Prestation extends StatelessWidget {
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width / 12;
    return Row(
      children: [
        Expanded(
          child: Container(
            width: width * 9,
            decoration: BoxDecoration(
              border: Border.all(color: kborderColor),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      width: 10,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10.0),
                            bottomLeft: Radius.circular(10.0)),
                        color: kWarAlertColor,
                      ),
                      child: SizedBox(
                        height: 50,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    SizedBox(
                      width: width * 6,
                      child: Text(
                        'tissage'.toUpperCase(),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: TextStyle(
                            color: kPrimaryColor,
                            fontSize: 20,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Expanded(
                        // width: 90,
                        child: Container(
                          // margin: EdgeInsets.symmetric(vertical: 10),
                          padding: EdgeInsets.only(top: 5, bottom: 5, left: 30),
                          decoration: BoxDecoration(
                            color: kWarAlertColor.withOpacity(0.3),
                            // border: Border.all(color: Colors.black)
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            '40',
                            textAlign: TextAlign.right,
                            style: TextStyle(
                                color: kWarAlertColor,
                                fontSize: 24,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                    ),
                    Text(
                      '€',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                          color: kWarAlertColor,
                          fontSize: 24,
                          fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          width: 10,
        ),
        InkWell(
          child: SvgPicture.asset('icons/corbeille.svg'),
          onTap: () {
            Get.defaultDialog(
                titlePadding: EdgeInsets.all(0),
                title: '',
                radius: 10,
                middleText: 'Souhaitez-vous supprimer cette prestation ?',
                actions: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: SizedBox(
                      height: buttonHeight,
                      child: OutlinedButton(
                        child: Text(
                          'CONFIRMER',
                          style: TextStyle(color: kPrimaryColor, fontSize: 16),
                        ),

                        style: OutlinedButton.styleFrom(
                            side: BorderSide(width: 1, color: kPrimaryColor),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            )),

                        // color: kSecondaryColor,
                        // shape: RoundedRectangleBorder(
                        //   borderRadius: BorderRadius.circular(10),
                        // ),
                        onPressed: () {
                          Get.offNamed('/coiffeuse/home');
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
                          style:
                              TextStyle(color: kSecondaryColor, fontSize: 16),
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
        )
      ],
    );
  }
}
