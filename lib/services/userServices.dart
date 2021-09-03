import 'dart:convert';
import 'package:bigoodee/constants.dart';
import 'package:bigoodee/helpers/resource.dart';
import 'package:bigoodee/models/error_message.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
// import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:http/http.dart' as http;
import 'package:translator/translator.dart';

class UserServices {
  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<String> createSomeUSer(String nom, String tel, String email,
      String pass, String role, String? ville, String? biographie) async {
    String message = " ";
    if (tel.length == 10) {
      tel.substring(1);
    }
    try {
      signOut();
      signOut();
      const url = apiURL + "/api/Users";
      Map data = {};
      if (role == 'coiffeuse') {
        data = {
          "nom": nom,
          "email": email,
          "password": pass,
          "telephone": '+33' + tel,
          "role": role,
          "ville": ville,
          "biographie": biographie
        };
      } else {
        data = {
          "nom": nom,
          "email": email,
          "password": pass,
          "telephone": '+33' + tel,
          "role": role
        };
      }
      print(data);
      var response = await http.post(Uri.parse(apiURL + "/api/Users"),
          headers: {
            'Content-type': 'application/json',
            'Accept': 'application/json'
          },
          body: json.encode(data));
      print(response.statusCode);
      if (response.statusCode == 201) {
        // var jsonString = response.body;
        // var jsonMap = json.decode(jsonString);
        // print("rceived JSON map: $jsonMap");
        message = "ok";
        await auth(email, pass);
      } else {
        var jsonString = response.body;
        var jsonMap = json.decode(jsonString);
        var err = ErrorModel.fromJson(jsonMap);
        message = err.message.split(" - ")[1];
        // print(message);
      }
    } catch (err) {
      message = "Une erreur c'est produite";
      print(err);
    }
    return message;
  }

  Future<Resource?> signInWithFacebook() async {
    try {
      signOut();
      signOut();
      final LoginResult result = await FacebookAuth.instance.login();
      print('result ${result.message}');
      switch (result.status) {
        case LoginStatus.success:
          final AuthCredential facebookCredential =
              FacebookAuthProvider.credential(result.accessToken!.token);
          final userCredential =
              await _auth.signInWithCredential(facebookCredential);
          return Resource(status: Status.Success);
        case LoginStatus.cancelled:
          return Resource(status: Status.Cancelled);
        case LoginStatus.failed:
          return Resource(status: Status.Error);
        default:
          return null;
      }
    } on FirebaseAuthException catch (e) {
      throw e;
    }
  }

  // getRole(id) async {
  //   String url = apiURL + "/api/Users/role/" + id;
  //   String res = "";
  //   // print(url.toString());
  //   var response = await http.get(Uri.parse(url));
  //   res = response.body;
  //   print(res);
  //   return res;
  // }

  Future<User?> auth(email, password) async {
    // var email = "noukimi.patrick@gmail.com";
    // var password = "test1234";
    String test = "";
    User? user;

    try {
      signOut();
      signOut();
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      // print("Les credentials sont $userCredential");
      user = userCredential.user;
      test = "ok " + userCredential.user!.uid;
    } on FirebaseAuthException catch (err) {
      // print("Les erreurs: $err");
      test = err.message!;
      var translation =
          await GoogleTranslator().translate(test, from: 'en', to: 'fr');
      Get.back();
      Get.snackbar('Validation', translation.text,
          animationDuration: Duration(seconds: 3),
          colorText: kSecondaryColor,
          backgroundColor: kErrorAlertColor.withOpacity(0.4));
      print(test);
    }
    return user;
  }

  User? getUser() {
    User? user;
    try {
      // var user  = _auth.authStateChanges();
      user = _auth.currentUser;
      print('user status $user.');
    } catch (err) {
      print('user error $err');
    }
    return user;
  }

  void signOut() async {
    await _auth.signOut();

    Get.offNamed('/connexion');
  }

//   Future<UserCredential> signInWithFacebook() async{
//     final AccessToken result = await FacebookAuth.instance.login();
//     // final FacebookLoginResult result = await FacebookLogin().logIn(['email']);
//     // final FacebookAccessToken accessToken = result.accessToken;
//     // AuthCredential credential = FacebookAuthProvider.credential(accessToken.token);
//     // final FacebookAuthCredential fbAuthCredential = FacebookAuthProvider.credential(accessToken.token);
//     // var a = await _auth.signInWithCredential(credential);
//     return FirebaseAuth.instance.signInWithCredential(fbAuthCredential);
//   }
// }

  // Future<UserCredential> signInWithFacebook() async {
  //   // Trigger the sign-in flow
  //   final LoginResult loginResult = await FacebookAuth.instance.login();

  //   // Create a credential from the access token
  //   final OAuthCredential facebookAuthCredential =
  //       FacebookAuthProvider.credential(loginResult.accessToken!.token);

  //   // Once signed in, return the UserCredential
  //   return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  // }
}
