import 'package:bigoodee/constants.dart';
import 'package:bigoodee/helpers/resource.dart';
import 'package:bigoodee/services/userServices.dart';
import 'package:bigoodee/views/coiffeuses/home_coiffeuse.dart';
import 'package:bigoodee/views/inscription_screen.dart';
import 'package:bigoodee/views/passe_oubie_screen.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:translator/translator.dart';
// import 'package:flutter_facebook_login/flutter_facebook_login.dart';

class ConnexionScreen extends StatefulWidget {
  const ConnexionScreen({Key? key}) : super(key: key);

  @override
  _ConnexionScreenState createState() => _ConnexionScreenState();
}

class _ConnexionScreenState extends State<ConnexionScreen> {
  late FocusNode FNMail, FNPass;
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  UserServices _userServices = UserServices();
  bool isSignIn = false;
  FirebaseAuth _auth = FirebaseAuth.instance;
  late User _user, users;
  late String role;
  // FacebookLogin facebookLogin = FacebookLogin();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FNMail = FocusNode();
    FNPass = FocusNode();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passController.dispose();
    FNMail.dispose();
    FNPass.dispose();
    // TODO: implement dispose
    super.dispose();
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

  late final String _userEmail;
  bool _secureText = true;

  //final _init = Firebase.initializeApp();
  //final FirebaseAuth _auth = FirebaseAuth.instance;

//   void _signInWithEmailAndPassword() async {

//   final user = (await _auth.signInWithEmailAndPassword(
//     email: 'noukimi.patrick@gmail.com',//_emailController.text,
//     password: 'test123456'//_passwordController.text,
//   )).user;

//   if (user != null) {
//     setState(() {
//       //_success = true;
//       // _userEmail = user.email;

//     });
//   } else {
//     setState(() {
//       // _success = false;
//     });
//   }
//     print(user);
// }

  @override
  Widget build(BuildContext context) {
    // future: _init;
    late FocusScope scope;
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 100,
            centerTitle: true,
            title: Text(
              'Connexion',
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
                                controller: _emailController,
                                focusNode: FNMail,
                                onTap: _requestFocusMail,
                                keyboardType: TextInputType.emailAddress,
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
                              SizedBox(height: 10),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  TextButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    FogotPassScreen()));
                                      },
                                      child: Text(
                                        'Mot de passe oublié ?',
                                        style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: kPrimaryColor,
                                            fontSize: 12),
                                      ))
                                ],
                              ),
                              // SizedBox(height: 10),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 0),
                                child: SizedBox(
                                  // height: 50,
                                  width: double.infinity,
                                  child: FlatButton(
                                    child: Text(
                                      'SE CONNECTER',
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
                                        // Navigator.push(context, MaterialPageRoute(builder: (context) => ConfirmCompescreen(name: 'Nom de test')));
                                        String user = await _userServices.auth(
                                            _emailController.text,
                                            _passController.text);
                                        _userServices.getUser();
                                        if (user.split(' ')[0] == 'ok') {
                                          // setState(() => {
                                          //       role = _userServices
                                          //           .getRole(user.split(' ')[1])
                                          //           .toString(),
                                          //     });
                                          // print('roles is $role');
                                          // if (role == "client") {
                                          //   Get.offAllNamed('/cliente/accueil');
                                          // } else if (role == 'coiffeuse') {
                                          //   Get.offAllNamed('/coiffeuse/home');
                                          // }
                                          Get.offAllNamed('/coiffeuse/home');
                                          Get.back();
                                        } else {
                                          var translation =
                                              await GoogleTranslator()
                                                  .translate(user,
                                                      from: 'en', to: 'fr');
                                          Get.back();
                                          Get.snackbar(
                                              'Validation', translation.text,
                                              animationDuration:
                                                  Duration(seconds: 3),
                                              colorText: kSecondaryColor,
                                              backgroundColor: kErrorAlertColor
                                                  .withOpacity(0.4));
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
                                    'Se connecter avec',
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
                                      signInWithFacebook();
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
                                          text: "Vous n'avez pas de compte? ",
                                        ),
                                        TextSpan(
                                            text: "S'inscrire",
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
                                                            InscriptionScreen()));
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

  Future<Resource?> signInWithFacebook() async {
    try {
      final LoginResult result = await FacebookAuth.instance.login();
      switch (result.status) {
        case LoginStatus.success:
          final AuthCredential facebookCredential =
              FacebookAuthProvider.credential(result.accessToken!.token);
          final userCredential =
              await _auth.signInWithCredential(facebookCredential);
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => AccueilCoffeuse()),
              (route) => false);
          return Resource(status: Status.Success);
        case LoginStatus.cancelled:
          print('error 1');
          return Resource(status: Status.Cancelled);
        case LoginStatus.failed:
          print('error 2');
          return Resource(status: Status.Error);
        default:
          return null;
      }
    } on FirebaseAuthException catch (e) {
      throw e;
    }
  }

  // Future<void> handleLogin() async {
  //   final FacebookLoginResult result = await facebookLogin.logIn(['email']);
  //   switch (result.status) {
  //     case FacebookLoginStatus.cancelledByUser:
  //       print("error3");
  //       break;
  //     case FacebookLoginStatus.error:
  //       print("error2");
  //       print(FacebookLoginStatus.values);
  //       break;
  //     case FacebookLoginStatus.loggedIn:
  //       try {
  //         print("ok");
  //         await loginWithfacebook(result);
  //         print("Succes");
  //         Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));

  //       } catch (e) {
  //         print("error1");
  //         print(e);
  //       }
  //       break;
  //   }
  // }

  // Future loginWithfacebook(FacebookLoginResult result) async {
  //   final FacebookAccessToken accessToken = result.accessToken;
  //   AuthCredential credential =
  //       FacebookAuthProvider.credential(accessToken.token);
  //       print("login");
  //   var a = await _auth.signInWithCredential(credential);
  //   print("sucessf");
  //   setState(() {
  //     isSignIn = true;
  //     _user = a.user!;
  //     print("User infos: ");
  //     print(a.user!);
  //   });
  // }

  // Future<void> gooleSignout() async {
  //   await _auth.signOut().then((onValue) {
  //     setState(() {
  //       facebookLogin.logOut();
  //       isSignIn = false;
  //     });
  //   });
  // }

}
