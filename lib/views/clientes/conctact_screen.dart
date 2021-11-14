import 'package:bigoodee/constants.dart';
import 'package:bigoodee/enums.dart';
import 'package:bigoodee/helpers/customNavBarClient.dart';
import 'package:bigoodee/services/userServices.dart';
import 'package:bigoodee/views/coiffeuses/prestation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:translator/translator.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({Key? key}) : super(key: key);

  @override
  _ContactScreenState createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  late FocusNode myFocusNod, FNObject;
  // User? user;

  final _biographieController = TextEditingController();
  final _objetController = TextEditingController();

  @override
  void initState() {
    super.initState();
    myFocusNod = FocusNode();
    FNObject = FocusNode();
  }

  @override
  void dispose() {
    _biographieController.dispose();
    _objetController.dispose();
    myFocusNod.dispose();
    FNObject.dispose();
    super.dispose();
  }

  void _requestFocus() {
    setState(() {
      FocusScope.of(context).requestFocus(myFocusNod);
    });
  }

  void _requestFocusObjet() {
    setState(() {
      FocusScope.of(context).requestFocus(FNObject);
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
                'Nous contacter',
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
                            Form(
                                key: _formKey,
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      TextFormField(
                                        controller: _objetController,
                                        focusNode: FNObject,
                                        onTap: _requestFocusObjet,
                                        cursorColor: kTextColor,
                                        style: TextStyle(
                                          color: kTextColor,
                                        ),
                                        decoration: InputDecoration(
                                          contentPadding: EdgeInsets.symmetric(
                                              horizontal: 20, vertical: 10),
                                          focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: kPrimaryColor,
                                                  width: 1.0)),
                                          labelText: 'objet',
                                          hintText: 'objet',
                                          labelStyle: TextStyle(
                                              color: FNObject.hasFocus
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
                                            return 'Veuillez renseigner l\'objet';
                                          }
                                          return null;
                                        },
                                      ),
                                      SizedBox(height: 20),
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
                                          labelText: 'commentaires',
                                          hintText: 'commentaires',
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
                                            return 'Veuillez renseigner votre commentaires';
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
                                          width: double.infinity,
                                          child: FlatButton(
                                              child: Text(
                                                'envoyer'.toUpperCase(),
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
                                                }
                                              }),
                                        ),
                                      ),
                                    ]))
                          ]),
                    )))));
  }
}
