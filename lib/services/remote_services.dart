import 'package:http/http.dart' as http;
import 'package:bigoodee/models/Product.dart';

class RemoteServices {
  static var client = http.Client();

  static Future<List<Product>>? fetchProducts() async {
    var response = await client.get(Uri.parse(
        "https://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline"));
    var jsonString = response.body;
    return productFromJson(jsonString);
  }
}
