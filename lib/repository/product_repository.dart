import 'dart:convert';

import 'package:SMSAndroid/models/product.dart';
import 'package:SMSAndroid/models/product_response.dart';
import 'package:http/http.dart' as http;

class ProductRepository {
  static String mainUrl = "https://mysmsapi.azurewebsites.net/api/v1.0";

  var getProductUrl = "$mainUrl/Product";

  Future<List<Product>> getProducts() async {
    final response = await http.get(getProductUrl + "/getAll");
    if (response.statusCode == 200) {
      return json
          .decode(response.body)
          .map<Product>((item) => Product.fromJson(item))
          .toList();
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

  Future<ProductResponse> getProductbyCat(int catId, int pageNumber) async {
    final response = await http.get(getProductUrl +
        "/?PageNumber=$pageNumber&field=Category&ProductCategoryId=$catId");
    if (response.statusCode == 200) {
      return ProductResponse.fromJson(response.body);
    } else {
      throw Exception('Failed to load Products');
    }
  }
}
