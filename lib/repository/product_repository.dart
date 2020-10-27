import 'package:SMSAndroid/models/product_response.dart';
import 'package:http/http.dart' as http;

class ProductRepository {
  static String mainUrl = "https://scam2020.azurewebsites.net/api/";
  static String version = "1.0";
  var getProductUrl = "$mainUrl/v$version/Products";

  Future<ProductResponse> getProducts() async {
    final response = await http.get(getProductUrl);

    if (response.statusCode == 200) {
      return ProductResponse.fromJson(response.body);
    } else {
      throw Exception('Failed to load Products');
    }
  }

  Future<ProductResponse> getProduct(int productId) async {
    final response = await http.get(getProductUrl);

    if (response.statusCode == 200) {
      return ProductResponse.fromJson(response.body);
    } else {
      throw Exception('Failed to load post Product');
    }
  }
}
