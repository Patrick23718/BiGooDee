import 'package:bigoodee/constants.dart';
import 'package:bigoodee/services/userServices.dart';
import 'package:bigoodee/views/coiffeuses/home_coiffeuse.dart';
import 'package:translator/translator.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class CreationCompteScreen extends StatefulWidget {
  const CreationCompteScreen({Key? key}) : super(key: key);

  @override
  _CreationCompteScreenState createState() => _CreationCompteScreenState();
}

class _CreationCompteScreenState extends State<CreationCompteScreen> {
  late FocusNode myFocusNod, FNTel, FNMail, FNPass;
  late FocusNode myTelFocusNode;

  UserServices _userServices = UserServices();
  User? user;

  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  final _nomController = TextEditingController();
  final _telController = TextEditingController();

  @override
  void initState() {
    // // TODO: implement initState
    // super.initState();
    // user = _userServices.getUser();
    // if (user == null) {
    //   //Navigator.push(context, MaterialPageRoute(builder: (context) => ConnexionScreen()));
    // } else {
    //   // print("object");
    //   Get.offNamed('/coiffeuse/home');
    // }
    myTelFocusNode = FocusNode();
    myFocusNod = FocusNode();
    FNTel = FocusNode();
    FNMail = FocusNode();
    FNPass = FocusNode();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passController.dispose();
    _nomController.dispose();
    _telController.dispose();
    myTelFocusNode.dispose();
    myFocusNod.dispose();
    FNTel.dispose();
    FNMail.dispose();
    FNPass.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  void _requestFocus() {
    setState(() {
      FocusScope.of(context).requestFocus(myFocusNod);
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

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _secureText = true;
  @override
  Widget build(BuildContext context) {
    late FocusScope scope;
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 100,
            centerTitle: true,
            title: Text(
              'Renseigner mon compte',
              style: headingStyle,
            ),
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.black,
                size: textMediumH1,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            backgroundColor: Colors.transparent,
            bottomOpacity: 0,
            elevation: 0,
          ),
          body: SingleChildScrollView(
              // keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              child: Padding(
                  padding: EdgeInsets.all(defaultPadding),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Afin de compléter votre compte, merci de renseigner les informations suivantes: ",
                          style: subHeadingStyle,
                        ),
                        SizedBox(height: 60),
                        Form(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              TextFormField(
                                controller: _nomController,
                                focusNode: myFocusNod,
                                onTap: _requestFocus,
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
                                      color: myFocusNod.hasFocus
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
                                controller: _telController,
                                focusNode: FNTel,
                                onTap: _requestFocusTel,
                                cursorColor: kTextColor,
                                style: TextStyle(
                                  color: kTextColor,
                                ),
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly
                                ],
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
                                focusNode: FNMail,
                                onTap: _requestFocusMail,
                                cursorColor: kTextColor,
                                style: TextStyle(
                                  color: kTextColor,
                                ),
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 10),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: kPrimaryColor, width: 1.0)),
                                  labelText: 'email@',
                                  hintText: 'email@',
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
                                  labelText: 'Créer un mot de passe',
                                  hintText: 'Créer un mot de passe',
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
                                ),
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
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                child: SizedBox(
                                  // height: 50,
                                  width: double.infinity,
                                  child: FlatButton(
                                      child: Text(
                                        'VALIDER',
                                        style: TextStyle(
                                            color: kSecondaryColor,
                                            fontSize: 16),
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
                                              content:
                                                  CircularProgressIndicator(
                                                color: kPrimaryColor,
                                              ));
                                          String? data = await _userServices
                                              .createSomeUSer(
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
                                                backgroundColor:
                                                    kErrorAlertColor
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
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        AccueilCoffeuse())); //(context, MaterialPageRoute(builder: (context) => ConfirmCompescreen()));
                                          }
                                        }
                                      }),
                                ),
                              ),
                              // Padding(
                              //   padding: const EdgeInsets.symmetric(vertical: 16.0),

                              //   child: ElevatedButton(
                              //     ,
                              //     onPressed: () {
                              //       // Validate will return true if the form is valid, or false if
                              //       // the form is invalid.
                              //       if (_formKey.currentState!.validate()) {
                              //         // Process data.
                              //       }
                              //     },
                              //     child: const Text('Submit'),
                              //   ),
                              // ),
                            ],
                          ),
                        )
                      ])))),
    );
  }
}
