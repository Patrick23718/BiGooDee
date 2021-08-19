import 'dart:io';

import 'package:bigoodee/constants.dart';
import 'package:bigoodee/enums.dart';
import 'package:bigoodee/helpers/coustom_bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class AjoutPrestationScreen extends StatefulWidget {
  const AjoutPrestationScreen({Key? key}) : super(key: key);

  @override
  _AjoutPrestationScreenState createState() => _AjoutPrestationScreenState();
}

class _AjoutPrestationScreenState extends State<AjoutPrestationScreen> {
  late FocusNode FNMail;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FNMail = FocusNode();
  }

  @override
  void dispose() {
    FNMail.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  void _requestFocusMail() {
    setState(() {
      FocusScope.of(context).requestFocus(FNMail);
    });
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    int _ratingController = 1;
    double width = MediaQuery.of(context).size.width / 12;
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
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
            backgroundColor: Colors.transparent,
            bottomOpacity: 0,
            elevation: 0,
          ),
          bottomNavigationBar: CustomBottomNavBar(
            selectedMenu: MenuState.planning,
          ),
          body: SingleChildScrollView(
              child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(children: [
                    Text(
                      'Vous pouvez ajouter une nouvelle prestation à tous moment.',
                      style: normalStyleText,
                    ),
                    SizedBox(height: 40),
                    Form(
                        key: _formKey,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                // height: width * 1.8,
                                width: double.infinity,
                                // margin: EdgeInsets.only(left: 10, right: 10),
                                height: 50,
                                decoration: BoxDecoration(
                                  border: Border.all(color: kTextOnlyColor),
                                  borderRadius: BorderRadius.circular(10),
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
                                                  MainAxisAlignment.end,
                                              children: [
                                                Text(
                                                  'Type de prestation',
                                                  style: TextStyle(
                                                      fontSize: textRegularH2,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                                SizedBox(
                                                  width: 40,
                                                ),
                                                IconButton(
                                                  onPressed: () => Get.back(),
                                                  icon: SvgPicture.asset(
                                                      'icons/close.svg'),
                                                )
                                              ],
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            InputPrestation(
                                              text: 'Braids',
                                            ),
                                            SizedBox(
                                              height: inputInterligne,
                                            ),
                                            InputPrestation(
                                                text: 'Vanilles (twists)'),
                                            SizedBox(
                                              height: inputInterligne,
                                            ),
                                            InputPrestation(text: 'Tissages'),
                                            SizedBox(
                                              height: inputInterligne,
                                            ),
                                            InputPrestation(
                                                text: 'Nattes colléss'),
                                            SizedBox(
                                              height: inputInterligne,
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 10),
                                              child: SizedBox(
                                                width: double.infinity,
                                                height: buttonHeight,
                                                child: FlatButton(
                                                  child: Text(
                                                    'valider'.toUpperCase(),
                                                    style: TextStyle(
                                                        color: kSecondaryColor,
                                                        fontSize: 16),
                                                  ),
                                                  color: kPrimaryColor,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
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
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: <Widget>[
                                            SvgPicture.asset('icons/hair.svg'),
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
                                height: inputInterligne,
                              ),
                              TextFormField(
                                focusNode: FNMail,
                                onTap: _requestFocusMail,
                                cursorColor: kTextColor,
                                style: TextStyle(
                                  color: kTextColor,
                                ),
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 10),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: kPrimaryColor, width: 1.0)),
                                  labelText: 'Tarif',
                                  hintText: 'Tarif',
                                  labelStyle: TextStyle(
                                      color: FNMail.hasFocus
                                          ? kPrimaryColor
                                          : kTextOnlyColor //FocusScope.of(context).hasFocus ? kPrimaryColor : kTextOnlyColor
                                      ),
                                  hintStyle: TextStyle(
                                    fontSize: textRegularP1,
                                    color: kTextOnlyColor,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                  ),
                                  prefixIcon: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: SvgPicture.asset('icons/tarif.svg'),
                                  ),
                                ),
                                validator: (String? value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Veuillez renseigner votre email';
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(height: 40),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                child: Center(
                                  child: SizedBox(
                                    width: width * 8,
                                    height: buttonHeight,
                                    child: FlatButton(
                                      child: Text(
                                        'valider'.toUpperCase(),
                                        style: TextStyle(
                                            color: kSecondaryColor,
                                            fontSize: 16),
                                      ),
                                      color: kPrimaryColor,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      onPressed: () {
                                        Get.offNamed(
                                            '/coiffeuse/addprestations');
                                        //  Navigator.push(context, MaterialPageRoute(builder: (context) => Acceuil()));
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ]))
                  ])))),
    );
  }
}

// ignore: must_be_immutable
class InputPrestation extends StatelessWidget {
  final String text;

  const InputPrestation({Key? key, required this.text}) : super(key: key);

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
                ],
              ),
            ),
          ),
        ));
  }
}

class TypePrestation extends StatelessWidget {
  final String text;

  const TypePrestation({Key? key, required this.text}) : super(key: key);

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
