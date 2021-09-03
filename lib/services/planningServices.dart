import 'dart:convert';

import 'package:bigoodee/constants.dart';
import 'package:bigoodee/models/Planning.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class PlanningServices {
  static var client = http.Client();

  void createPlanning(String uid, String date, String plage) async {
    Map data = {
      "uid": uid,
      "date": date,
      "plage": plage,
    };

    try {
      var response = await http.post(Uri.parse(apiURL + "/planing"),
          headers: {
            'Content-type': 'application/json',
            'Accept': 'application/json'
          },
          body: json.encode(data));

      if (response.statusCode == 201) {
        Get.snackbar('Succuès', 'Disponibilité ajoutée',
            animationDuration: Duration(seconds: 3),
            colorText: kSecondaryColor,
            backgroundColor: kSuccessAlertColor.withOpacity(0.4));
      } else {
        Get.snackbar('Erreur', 'Veillez réessayer',
            animationDuration: Duration(seconds: 3),
            colorText: kSecondaryColor,
            backgroundColor: kWarAlertColor.withOpacity(0.4));
      }
    } catch (e) {
      Get.snackbar('Erreur', 'Une erreur c\'est produite',
          animationDuration: Duration(seconds: 3),
          colorText: kSecondaryColor,
          backgroundColor: kErrorAlertColor.withOpacity(0.4));
      print(e);
    }
  }

  void deletePlannig(String uid, String date, String plage) async {
    try {
      var response = await http.delete(
          Uri.parse(apiURL + "/planing/" + uid + "/" + date + "/" + plage),
          headers: {
            'Content-type': 'application/json',
            'Accept': 'application/json'
          });

      if (response.statusCode == 200) {
        Get.snackbar('Succuès', 'Disponibilité retirée',
            animationDuration: Duration(seconds: 3),
            colorText: kSecondaryColor,
            backgroundColor: kSuccessAlertColor.withOpacity(0.4));
      } else {
        Get.snackbar('Erreur', 'Veillez réessayer',
            animationDuration: Duration(seconds: 3),
            colorText: kSecondaryColor,
            backgroundColor: kWarAlertColor.withOpacity(0.4));
      }
    } catch (e) {
      Get.snackbar('Erreur', 'Une erreur c\'est produite',
          animationDuration: Duration(seconds: 3),
          colorText: kSecondaryColor,
          backgroundColor: kErrorAlertColor.withOpacity(0.4));
      print(e);
    }
  }

  Future<List<Planning>?>? fetchPlanning(String uid, String date) async {
    // ignore: avoid_init_to_null
    var planning = null;
    try {
      var response =
          await client.get(Uri.parse(apiURL + "/planing/" + uid + "/" + date));
      var jsonString = response.body;

      planning = planningFromJson(jsonString);
    } catch (e) {
      print(e);
      return planning;
    }
    return planning;
  }
}
