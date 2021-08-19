import 'package:bigoodee/constants.dart';
import 'package:bigoodee/services/userServices.dart';
import 'package:bigoodee/views/coiffeuses/home_coiffeuse.dart';
import 'package:bigoodee/views/connexion_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class InscriptionScreen extends StatefulWidget {
  const InscriptionScreen({Key? key}) : super(key: key);

  @override
  _InscriptionScreenState createState() => _InscriptionScreenState();
}

class _InscriptionScreenState extends State<InscriptionScreen> {
  late FocusNode FNMail, FNPass, FNPassCon;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FNMail = FocusNode();
    FNPass = FocusNode();
    FNPassCon = FocusNode();
  }

  @override
  void dispose() {
    FNMail.dispose();
    FNPass.dispose();
    FNPassCon.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  UserServices _userServices = UserServices();

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
            toolbarHeight: 100,
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
                  padding: EdgeInsets.all(defaultPadding),
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
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
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(height: 20),
                              TextFormField(
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
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(height: 20),
                              TextFormField(
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
                                    labelText: 'confirmer mot de passe',
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
                                obscureText: _secureText,
                                validator: (String? value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Veuillez renseigner votre mot de passe';
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(height: 10),
                              // SizedBox(height: 10),
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
                                    onPressed: () {
                                      // Validate will return true if the form is valid, or false if
                                      // the form is invalid.
                                      if (_formKey.currentState!.validate()) {
                                        // Navigator.push(context, MaterialPageRoute(builder: (context) => ConfirmCompescreen(name: 'Nom de test')));
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
                                    onPressed: () {
                                      // Validate will return true if the form is valid, or false if
                                      // the form is invalid.
                                      _userServices
                                          .signInWithFacebook()
                                          .then((UserCredential value) {
                                        Navigator.pushAndRemoveUntil(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    AccueilCoffeuse()),
                                            (route) => false);
                                      }).catchError((onError) {
                                        print("pas ok");
                                        print(onError);
                                      });
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
