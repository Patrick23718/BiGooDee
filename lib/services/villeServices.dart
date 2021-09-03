import 'dart:convert';

import 'package:bigoodee/constants.dart';
import 'package:bigoodee/models/Ville.dart';
import 'package:http/http.dart' as http;

class VilleService {
  Future<Ville?> getVille() async {
    var villeModel = null;
    try {
      var response = await http.get(Uri.parse(apiURL + "/ville"));
      if (response.statusCode == 200) {
        var jsonString = response.body;
        var jsonMap = json.decode(jsonString);
        villeModel = Ville.fromJson(jsonMap);
      }
    } catch (e) {
      print(e);
    }
    return villeModel;
  }
}
