import 'package:bigoodee/constants.dart';
import 'package:bigoodee/services/userServices.dart';
import 'package:bigoodee/views/coiffeuses/prestation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:translator/translator.dart';

class BiographieScreen extends StatefulWidget {
  const BiographieScreen({Key? key}) : super(key: key);

  @override
  _BiographieScreenState createState() => _BiographieScreenState();
}

class _BiographieScreenState extends State<BiographieScreen> {
  late FocusNode myFocusNod;
  late String nom;
  late String ville;
  late String tel;
  late String pass;
  late String mail;

  UserServices _userServices = UserServices();
  // User? user;

  final _biographieController = TextEditingController();

  @override
  void initState() {
    super.initState();
    myFocusNod = FocusNode();
    this.nom = Get.parameters['prenom'].toString() +
        '%' +
        Get.parameters['nom'].toString();
    this.tel = Get.parameters['tel'].toString();
    this.mail = Get.parameters['mail'].toString();
    this.pass = Get.parameters['pass'].toString();
    this.ville = Get.parameters['ville'].toString();
    print(nom);
    print(tel);
    print(mail);
    print(pass);
    print(ville);
  }

  @override
  void dispose() {
    _biographieController.dispose();
    myFocusNod.dispose();
    super.dispose();
  }

  void _requestFocus() {
    setState(() {
      FocusScope.of(context).requestFocus(myFocusNod);
    });
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width / 12;
    return GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
            appBar: AppBar(
              toolbarHeight: 100,
              centerTitle: true,
              title: Text(
                'Ajouter une biographie',
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
            body: SingleChildScrollView(
                // keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
                child: Padding(
                    padding: EdgeInsets.only(
                        top: 0,
                        left: defaultPadding,
                        bottom: defaultPadding,
                        right: defaultPadding),
                    child: Center(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            // Container(
                            //   width: double.infinity,
                            //   child: Text(
                            //     "",
                            //     style: subHeadingStyle,
                            //     textAlign: TextAlign.right,
                            //   ),
                            // ),
                            SizedBox(height: 10),
                            Text(
                              "Afin de compléter votre compte, merci de vous presenter en quelques lignes: ",
                              style: subHeadingStyle,
                            ),
                            SizedBox(height: 20),
                            Form(
                                key: _formKey,
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      TextFormField(
                                        controller: _biographieController,
                                        focusNode: myFocusNod,
                                        onTap: _requestFocus,
                                        cursorColor: kTextColor,
                                        style: TextStyle(
                                          color: kTextColor,
                                        ),
                                        keyboardType: TextInputType.multiline,
                                        maxLines: 10,
                                        decoration: InputDecoration(
                                          contentPadding: EdgeInsets.symmetric(
                                              horizontal: 20, vertical: 10),
                                          focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: kPrimaryColor,
                                                  width: 1.0)),
                                          labelText: 'Biographie',
                                          hintText: 'Biographie',
                                          labelStyle: TextStyle(
                                              color: myFocusNod.hasFocus
                                                  ? kPrimaryColor
                                                  : kTextOnlyColor //FocusScope.of(context).hasFocus ? kPrimaryColor : kTextOnlyColor
                                              ),
                                          hintStyle: TextStyle(
                                            fontSize: textRegularP1,
                                            color: kTextOnlyColor,
                                          ),
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10)),
                                          ),
                                        ),
                                        validator: (String? value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Veuillez renseigner votre Biographie';
                                          }
                                          return null;
                                        },
                                      ),
                                      SizedBox(height: 20),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 10),
                                        child: SizedBox(
                                          // height: 50,
                                          width: width * 8,
                                          child: FlatButton(
                                              child: Text(
                                                'continuer'.toUpperCase(),
                                                style: TextStyle(
                                                    color: kSecondaryColor,
                                                    fontSize: 16),
                                              ),
                                              color: kPrimaryColor,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              onPressed: () async {
                                                // Validate will return true if the form is valid, or false if
                                                // the form is invalid.
                                                if (_formKey.currentState!
                                                    .validate()) {
                                                  Get.defaultDialog(
                                                      barrierDismissible: false,
                                                      title: '',
                                                      backgroundColor:
                                                          kSecondaryColor
                                                              .withOpacity(0.5),
                                                      content:
                                                          CircularProgressIndicator(
                                                        color: kPrimaryColor,
                                                      ));
                                                  String? data =
                                                      await _userServices
                                                          .createSomeUSer(
                                                              nom,
                                                              tel,
                                                              mail,
                                                              pass,
                                                              "coiffeuse",
                                                              ville,
                                                              _biographieController
                                                                  .text);
                                                  print(data);
                                                  if (data != "ok") {
                                                    var translation =
                                                        await GoogleTranslator()
                                                            .translate(data,
                                                                from: 'en',
                                                                to: 'fr');

                                                    Get.back();
                                                    Get.back();
                                                    Get.snackbar('Validation',
                                                        translation.text,
                                                        animationDuration:
                                                            Duration(
                                                                seconds: 3),
                                                        colorText:
                                                            kSecondaryColor,
                                                        backgroundColor:
                                                            kErrorAlertColor
                                                                .withOpacity(
                                                                    0.4));
                                                  } else {
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              PrestationScreen(
                                                                  test:
                                                                      "start")),
                                                    );
                                                    //(context, MaterialPageRoute(builder: (context) => ConfirmCompescreen()));
                                                  }
                                                }
                                              }),
                                        ),
                                      ),
                                    ]))
                          ]),
                    )))));
  }
}
