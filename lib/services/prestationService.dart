import 'package:bigoodee/constants.dart';
import 'package:bigoodee/models/Prestation.dart';
import 'package:http/http.dart' as http;

class PrestationServices {
  static var client = http.Client();

  static Future<List<Prestation>>? fetchPrestations() async {
    var response = await client.get(Uri.parse(apiURL + "/prestation/"));
    var jsonString = response.body;
    return prestationFromJson(jsonString);
  }
}
