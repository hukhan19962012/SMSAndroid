import 'dart:convert';

import 'package:SMSAndroid/models/product.dart';

class ProductResponse {
  final List<Product> products;
  final String error;

  ProductResponse(this.products, this.error);

  ProductResponse.fromJson(String response)
      : products = json
            .decode(response)["data"]
            .map<Product>((item) => Product.fromJson(item))
            .toList(),
        error = "";

  ProductResponse.withError(String errorValue)
      : products = List(),
        error = errorValue;
}
