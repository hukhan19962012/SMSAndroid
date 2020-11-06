import 'dart:convert';

import 'package:SMSAndroid/models/product_category.dart';

class ProductCategoryResponse {
  final List<ProductCategory> productcats;
  final String error;

  ProductCategoryResponse(this.productcats, this.error);

  ProductCategoryResponse.fromJson(String response)
      : productcats = json
            .decode(response)["data"]
            .map<ProductCategory>((item) => ProductCategory.fromJson(item))
            .toList(),
        error = "";

  ProductCategoryResponse.withError(String errorValue)
      : productcats = List(),
        error = errorValue;
}
