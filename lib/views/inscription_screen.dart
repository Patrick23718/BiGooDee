import 'package:bigoodee/constants.dart';
import 'package:bigoodee/services/userServices.dart';
import 'package:bigoodee/views/coiffeuses/home_coiffeuse.dart';
import 'package:bigoodee/views/connexion_screen.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:translator/translator.dart';

class InscriptionScreen extends StatefulWidget {
  const InscriptionScreen({Key? key}) : super(key: key);

  @override
  _InscriptionScreenState createState() => _InscriptionScreenState();
}

class _InscriptionScreenState extends State<InscriptionScreen> {
  late FocusNode FNNom, FNTel, FNMail, FNPass, FNPassCon;

  final _nomController = TextEditingController();
  final _telController = TextEditingController();
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  final _passConController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FNMail = FocusNode();
    FNPass = FocusNode();
    FNPassCon = FocusNode();
    FNNom = FocusNode();
    FNTel = FocusNode();
  }

  @override
  void dispose() {
    FNMail.dispose();
    FNPass.dispose();
    FNPassCon.dispose();
    FNNom.dispose();
    FNTel.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  UserServices _userServices = UserServices();

  void _requestFocusNom() {
    setState(() {
      FocusScope.of(context).requestFocus(FNNom);
    });
  }

  void _requestFocusTel() {
    setState(() {
      FocusScope.of(context).requestFocus(FNTel);
    });
  }

  void _requestFocusMail() {
    setState(() {
      FocusScope.of(context).requestFocus(FNMail);
    });
  }

  void _requestFocusPass() {
    setState(() {
      FocusScope.of(context).requestFocus(FNPass);
    });
  }

  void _requestFocusPassCon() {
    setState(() {
      FocusScope.of(context).requestFocus(FNPassCon);
    });
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _secureText = true;
  bool _secureTextCon = true;
  @override
  Widget build(BuildContext context) {
    late FocusScope scope;
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 80,
            centerTitle: true,
            title: Text(
              'Inscription',
              style: headingStyle,
            ),
            leading: SizedBox(),
            backgroundColor: Colors.transparent,
            bottomOpacity: 0,
            elevation: 0,
          ),
          body: SingleChildScrollView(
              // keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              child: Padding(
                  padding: EdgeInsets.only(
                      left: defaultPadding,
                      right: defaultPadding,
                      bottom: defaultPadding,
                      top: 0),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        // Text(
                        //   "Afin decompléter votre compte, merci de renseigner les informations suivantes: ",
                        //   style: subHeadingStyle,
                        // ),
                        // SizedBox(height:60),
                        Form(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              TextFormField(
                                controller: _nomController,
                                focusNode: FNNom,
                                onTap: _requestFocusNom,
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
                                    labelText: 'Nom',
                                    hintText: 'Nom',
                                    labelStyle: TextStyle(
                                        color: FNNom.hasFocus
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
                                    suffixIcon: Padding(
                                      padding: const EdgeInsets.only(right: 10),
                                      child: Material(
                                        color: kPrimaryColor,
                                        elevation: 2.0,
                                        shadowColor: kPrimaryColor,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20)),
                                        child: Icon(Icons.person,
                                            size: 20, color: kSecondaryColor),
                                      ),
                                    ),
                                    suffixIconConstraints: BoxConstraints(
                                        minHeight: 35, minWidth: 45)
                                    //child: Icon(Icons.alternate_email, size: 24, color: kSecondaryColor),

                                    ),
                                validator: (String? value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Veuillez renseigner votre nom';
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(height: 20),
                              TextFormField(
                                keyboardType: TextInputType.number,
                                controller: _telController,
                                focusNode: FNTel,
                                onTap: _requestFocusTel,
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
                                    labelText: 'Numéro de téléphone',
                                    hintText: 'Numéro de téléphone',
                                    labelStyle: TextStyle(
                                        color: FNTel.hasFocus
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
                                    suffixIcon: Padding(
                                      padding: const EdgeInsets.only(right: 10),
                                      child: Material(
                                        color: kPrimaryColor,
                                        elevation: 2.0,
                                        shadowColor: kPrimaryColor,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20)),
                                        child: Icon(Icons.phone,
                                            size: 20, color: kSecondaryColor),
                                      ),
                                    ),
                                    suffixIconConstraints: BoxConstraints(
                                        minHeight: 35, minWidth: 45)
                                    //child: Icon(Icons.alternate_email, size: 24, color: kSecondaryColor),

                                    ),
                                validator: (String? value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Veuillez renseigner votre numéro';
                                  } else if (value.length < 9 ||
                                      value.length > 10) {
                                    return 'Numéro de téléphone incorrect';
                                  } else if (value.length == 10 &&
                                      value[0] != '0') {
                                    return 'Numéro de téléphone incorrect';
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(height: 20),
                              TextFormField(
                                controller: _emailController,
                                keyboardType: TextInputType.emailAddress,
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
                                    labelText: 'email',
                                    hintText: 'exemple@domaine.com',
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
                                    suffixIcon: Padding(
                                      padding: const EdgeInsets.only(right: 10),
                                      child: Material(
                                        color: kPrimaryColor,
                                        elevation: 2.0,
                                        shadowColor: kPrimaryColor,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20)),
                                        child: Icon(Icons.alternate_email,
                                            size: 20, color: kSecondaryColor),
                                      ),
                                    ),
                                    suffixIconConstraints: BoxConstraints(
                                        minHeight: 35, minWidth: 45)
                                    //child: Icon(Icons.alternate_email, size: 24, color: kSecondaryColor),

                                    ),
                                validator: (String? value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Veuillez renseigner votre email';
                                  } else if (!EmailValidator.validate(value)) {
                                    return 'entrez une adresse mail valide';
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(height: 20),
                              TextFormField(
                                controller: _passController,
                                focusNode: FNPass,
                                onTap: _requestFocusPass,
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
                                    labelText: 'mot de passe',
                                    hintText: 'mot de passe',
                                    labelStyle: TextStyle(
                                        color: FNPass.hasFocus
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
                                    suffixIcon: Padding(
                                      padding: const EdgeInsets.only(right: 10),
                                      child: Material(
                                        color: kPrimaryColor,
                                        elevation: 2.0,
                                        shadowColor: kPrimaryColor,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(30)),
                                        child: IconButton(
                                          icon: Icon(
                                              _secureText
                                                  ? Icons.visibility
                                                  : Icons.visibility_off,
                                              size: 20,
                                              color: kSecondaryColor),
                                          onPressed: () {
                                            setState(() {
                                              _secureText = !_secureText;
                                            });
                                          },
                                          constraints: BoxConstraints(
                                              maxHeight: 35, maxWidth: 35),
                                        ),
                                      ),
                                    ),
                                    suffixIconConstraints: BoxConstraints(
                                        minHeight: 35, minWidth: 35)),
                                obscureText: _secureText,
                                validator: (String? value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Veuillez renseigner votre mot de passe';
                                  } else if (value.length < 6) {
                                    return 'Ce champs doit contenir au moins 6 charactères';
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(height: 20),
                              TextFormField(
                                controller: _passConController,
                                focusNode: FNPassCon,
                                onTap: _requestFocusPassCon,
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
                                    labelText: 'confirmer mot de passe',
                                    hintText: 'mot de passe',
                                    labelStyle: TextStyle(
                                        color: FNPassCon.hasFocus
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
                                    suffixIcon: Padding(
                                      padding: const EdgeInsets.only(right: 10),
                                      child: Material(
                                        color: kPrimaryColor,
                                        elevation: 2.0,
                                        shadowColor: kPrimaryColor,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(30)),
                                        child: IconButton(
                                          icon: Icon(
                                              _secureTextCon
                                                  ? Icons.visibility
                                                  : Icons.visibility_off,
                                              size: 20,
                                              color: kSecondaryColor),
                                          onPressed: () {
                                            setState(() {
                                              _secureTextCon = !_secureTextCon;
                                            });
                                          },
                                          constraints: BoxConstraints(
                                              maxHeight: 35, maxWidth: 35),
                                        ),
                                      ),
                                    ),
                                    suffixIconConstraints: BoxConstraints(
                                        minHeight: 35, minWidth: 35)),
                                obscureText: _secureTextCon,
                                validator: (String? value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Veuillez renseigner votre mot de passe';
                                  } else if (value != _passController.text) {
                                    return 'Les mots de passe de concordent pas!';
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(height: 10),
                              RichText(
                                  text: TextSpan(style: normalStyle, children: [
                                TextSpan(
                                    text: "S'inscrire comme coiffeuse",
                                    style: TextStyle(
                                        decoration: TextDecoration.underline,
                                        color: kPrimaryColor,
                                        fontSize: 14),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        Get.toNamed('/coiffeuse/register');
                                      })
                              ])),
                              SizedBox(height: 30),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 0),
                                child: SizedBox(
                                  // height: 50,
                                  width: double.infinity,
                                  child: FlatButton(
                                    child: Text(
                                      'CRÉER SON COMPTE',
                                      style: TextStyle(
                                          color: kSecondaryColor, fontSize: 16),
                                    ),
                                    color: kPrimaryColor,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    onPressed: () async {
                                      // Validate will return true if the form is valid, or false if
                                      // the form is invalid.
                                      if (_formKey.currentState!.validate()) {
                                        Get.defaultDialog(
                                            barrierDismissible: false,
                                            title: '',
                                            backgroundColor: kSecondaryColor
                                                .withOpacity(0.5),
                                            content: CircularProgressIndicator(
                                              color: kPrimaryColor,
                                            ));
                                        String? data =
                                            await _userServices.createSomeUSer(
                                                _nomController.text,
                                                _telController.text,
                                                _emailController.text,
                                                _passController.text,
                                                "client",
                                                '',
                                                '');
                                        print(data);
                                        if (data != "ok") {
                                          var translation =
                                              await GoogleTranslator()
                                                  .translate(data,
                                                      from: 'en', to: 'fr');

                                          Get.back();
                                          Get.snackbar(
                                              'Validation', translation.text,
                                              animationDuration:
                                                  Duration(seconds: 3),
                                              colorText: kSecondaryColor,
                                              backgroundColor: kErrorAlertColor
                                                  .withOpacity(0.4));
                                          // showDialog(
                                          //     context: context,
                                          //     barrierColor: kPrimaryColor
                                          //         .withOpacity(0.2),
                                          //     builder: (context) {
                                          //       return AlertDialog(
                                          //         content: Text(data,
                                          //             textAlign:
                                          //                 TextAlign.center,
                                          //             style: normalStyle),
                                          //         actions: [
                                          //           TextButton(
                                          //               onPressed: () {
                                          //                 Navigator.of(
                                          //                         context)
                                          //                     .pop();
                                          //               },
                                          //               child: Text(
                                          //                 'ok'.toUpperCase(),
                                          //                 style: normalStyle,
                                          //               ))
                                          //         ],
                                          //       );
                                          // });
                                        } else {
                                          Get.offAllNamed(
                                              '/cliente/accueil'); //(context, MaterialPageRoute(builder: (context) => ConfirmCompescreen()));
                                        }
                                      }
                                    },
                                  ),
                                ),
                              ),
                              SizedBox(height: 15),
                              Image(
                                image: AssetImage('images/ou.png'),
                                // height: width * 12,
                              ),
                              SizedBox(height: 10),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Créer son compte avec',
                                    style: normalStyle,
                                  ),
                                ],
                              ),
                              SizedBox(height: 15),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 0),
                                child: SizedBox(
                                  // height: 50,
                                  width: double.infinity,
                                  child: FlatButton(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.facebook,
                                          color: kSecondaryColor,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          'FACEBOOK',
                                          style: TextStyle(
                                              color: kSecondaryColor,
                                              fontSize: 16),
                                        ),
                                      ],
                                    ),
                                    color: Color(0xff4267B2),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    onPressed: () async {
                                      // Validate will return true if the form is valid, or false if
                                      // the form is invalid.
                                      var test = await _userServices
                                          .signInWithFacebook();
                                      print('Facebook status ${test!.status}');
                                      //     .then().catchError((onError) {
                                      //   print("pas ok");
                                      //   print(onError);
                                      // });
                                    },
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  RichText(
                                      text: TextSpan(
                                          style: normalStyle,
                                          children: [
                                        TextSpan(
                                          text: "Vous avez déjà un compte? ",
                                        ),
                                        TextSpan(
                                            text: "Se connecter",
                                            style: TextStyle(
                                                decoration:
                                                    TextDecoration.underline,
                                                color: kPrimaryColor,
                                                fontSize: 12),
                                            recognizer: TapGestureRecognizer()
                                              ..onTap = () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            ConnexionScreen()));
                                              })
                                      ])),
                                ],
                              )
                            ],
                          ),
                        )
                      ])))),
    );
  }
}
