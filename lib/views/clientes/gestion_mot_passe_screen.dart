import 'package:bigoodee/constants.dart';
import 'package:bigoodee/enums.dart';
import 'package:bigoodee/helpers/customNavBarClient.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class GestionMotPasseScreen extends StatefulWidget {
  const GestionMotPasseScreen({Key? key}) : super(key: key);

  @override
  _GestionMotPasseScreenState createState() => _GestionMotPasseScreenState();
}

class _GestionMotPasseScreenState extends State<GestionMotPasseScreen> {
  late FocusNode FNPass, FNPass1, FNPass2;

  final _passController = TextEditingController();
  final _passController1 = TextEditingController();
  final _passController2 = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FNPass = FocusNode();
    FNPass1 = FocusNode();
    FNPass2 = FocusNode();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    FNPass.dispose();
    FNPass1.dispose();
    FNPass2.dispose();
  }

  void _requestFocusPass() {
    setState(() {
      FocusScope.of(context).requestFocus(FNPass);
    });
  }

  void _requestFocusPass1() {
    setState(() {
      FocusScope.of(context).requestFocus(FNPass1);
    });
  }

  void _requestFocusPass2() {
    setState(() {
      FocusScope.of(context).requestFocus(FNPass2);
    });
  }

  bool _secureText = false;
  bool _secureText1 = true;
  bool _secureText2 = true;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 100,
            centerTitle: true,
            title: Text(
              'Gestion du mot passe',
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
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
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
                              borderSide:
                                  BorderSide(color: kPrimaryColor, width: 1.0)),
                          labelText: 'mot de passe actuel',
                          hintText: 'mot de passe actuel',
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
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          suffixIcon: Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Material(
                              color: kPrimaryColor,
                              elevation: 2.0,
                              shadowColor: kPrimaryColor,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30)),
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
                                constraints:
                                    BoxConstraints(maxHeight: 35, maxWidth: 35),
                              ),
                            ),
                          ),
                          suffixIconConstraints:
                              BoxConstraints(minHeight: 35, minWidth: 35)),
                      obscureText: _secureText,
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Veuillez renseigner votre mot de passe actuel';
                        } else if (value.length < 6) {
                          return 'Ce champs doit contenir au moins 6 charactères';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      controller: _passController1,
                      focusNode: FNPass1,
                      onTap: _requestFocusPass1,
                      cursorColor: kTextColor,
                      style: TextStyle(
                        color: kTextColor,
                      ),
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: kPrimaryColor, width: 1.0)),
                          labelText: 'nouveau mot de passe',
                          hintText: 'nouveau mot de passe',
                          labelStyle: TextStyle(
                              color: FNPass1.hasFocus
                                  ? kPrimaryColor
                                  : kTextOnlyColor //FocusScope.of(context).hasFocus ? kPrimaryColor : kTextOnlyColor
                              ),
                          hintStyle: TextStyle(
                            fontSize: textRegularP1,
                            color: kTextOnlyColor,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          suffixIcon: Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Material(
                              color: kPrimaryColor,
                              elevation: 2.0,
                              shadowColor: kPrimaryColor,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30)),
                              child: IconButton(
                                icon: Icon(
                                    _secureText1
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    size: 20,
                                    color: kSecondaryColor),
                                onPressed: () {
                                  setState(() {
                                    _secureText1 = !_secureText1;
                                  });
                                },
                                constraints:
                                    BoxConstraints(maxHeight: 35, maxWidth: 35),
                              ),
                            ),
                          ),
                          suffixIconConstraints:
                              BoxConstraints(minHeight: 35, minWidth: 35)),
                      obscureText: _secureText1,
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Veuillez renseigner votre nouveau mot de passe';
                        } else if (value.length < 6) {
                          return 'Ce champs doit contenir au moins 6 charactères';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      controller: _passController2,
                      focusNode: FNPass2,
                      onTap: _requestFocusPass2,
                      cursorColor: kTextColor,
                      style: TextStyle(
                        color: kTextColor,
                      ),
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: kPrimaryColor, width: 1.0)),
                          labelText: 'confirmer le mot de passe',
                          hintText: 'confirmer le mot de passe',
                          labelStyle: TextStyle(
                              color: FNPass2.hasFocus
                                  ? kPrimaryColor
                                  : kTextOnlyColor //FocusScope.of(context).hasFocus ? kPrimaryColor : kTextOnlyColor
                              ),
                          hintStyle: TextStyle(
                            fontSize: textRegularP1,
                            color: kTextOnlyColor,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          suffixIcon: Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Material(
                              color: kPrimaryColor,
                              elevation: 2.0,
                              shadowColor: kPrimaryColor,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30)),
                              child: IconButton(
                                icon: Icon(
                                    _secureText2
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    size: 20,
                                    color: kSecondaryColor),
                                onPressed: () {
                                  setState(() {
                                    _secureText2 = !_secureText2;
                                  });
                                },
                                constraints:
                                    BoxConstraints(maxHeight: 35, maxWidth: 35),
                              ),
                            ),
                          ),
                          suffixIconConstraints:
                              BoxConstraints(minHeight: 35, minWidth: 35)),
                      obscureText: _secureText2,
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Veuillez confirmer votre mot de passe';
                        } else if (value.length < 6) {
                          return 'Ce champs doit contenir au moins 6 charactères';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 40),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 0),
                      child: SizedBox(
                        // height: 50,
                        width: double.infinity,
                        child: FlatButton(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            child: Text(
                              'enregistrer'.toUpperCase(),
                              style: TextStyle(
                                  color: kSecondaryColor, fontSize: 16),
                            ),
                          ),
                          color: kPrimaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          onPressed: () async {
                            // Validate will return true if the form is valid, or false if
                            // the form is invalid.
                            if (_formKey.currentState!.validate()) {
                              Get.snackbar('Validate', "Validation ok");
                            }
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
