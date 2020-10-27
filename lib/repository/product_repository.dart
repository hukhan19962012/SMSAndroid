import 'package:SMSAndroid/models/product_response.dart';
import 'package:http/http.dart' as http;

class ProductRepository {
  static String mainUrl = "https://mysmsapi.azurewebsites.net/api/v1.0";

  var getProductUrl = "$mainUrl/Product";

  Future<ProductResponse> getProducts() async {
    final response = await http.get(Uri.encodeFull(getProductUrl),
        headers: {"Accept": "application/json"});
    if (response.statusCode == 200) {
      return ProductResponse.fromJson(response.body);
    } else {
      throw Exception('Failed to load Products');
    }
  }

  Future<ProductResponse> getProduct(int productId) async {
    final response = await http.get(getProductUrl + "/$productId");

    if (response.statusCode == 200) {
      return ProductResponse.fromJson(response.body);
    } else {
      throw Exception('Failed to load post Product');
    }
  }
}
