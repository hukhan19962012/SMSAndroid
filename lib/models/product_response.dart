import 'dart:convert';

import 'product.dart';

class ProductResponse {
  final List<Product> products;
  final String error;

  ProductResponse(this.products, this.error);

  ProductResponse.fromJson(String response)
      : products = json
            .decode(response)
            .map<Product>((item) => Product.fromJson(item))
            .toList(),
        error = "";

  ProductResponse.withError(String errorValue)
      : products = List(),
        error = errorValue;
}
