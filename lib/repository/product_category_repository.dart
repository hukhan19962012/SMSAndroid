import 'package:SMSAndroid/models/product_category_response.dart';
import 'package:http/http.dart' as http;

class ProductCategoryRepository {
  static String mainUrl = "https://mysmsapi.azurewebsites.net/api/v1.0";
  var getCategorytUrl = "$mainUrl/ProductsCategory";
  Future<ProductCategoryResponse> getProductcats() async {
    final response = await http.get(getCategorytUrl);
    if (response.statusCode == 200) {
      return ProductCategoryResponse.fromJson(response.body);
    } else {
      throw Exception('Failed to load Products');
    }
  }
}
