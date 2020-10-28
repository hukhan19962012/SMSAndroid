import 'dart:convert';

import 'package:SMSAndroid/models/product_variety.dart';

Product productFromJson(String str) => Product.fromJson(json.decode(str));

String productToJson(Product data) => json.encode(data.toJson());

class Product {
  Product({
    this.id,
    this.name,
    this.description,
    this.price,
    this.img,
    this.isActive,
    this.productVarietys,
  });

  int id;
  String name;
  String description;
  int price;
  String img;
  bool isActive;
  List<ProductVariety> productVarietys;

  factory Product.fromJson(Map<String, dynamic> json) {
    List<dynamic> productVariety = json["productVarietys"];
    List<ProductVariety> listProductVariety =
        productVariety.map((e) => ProductVariety.fromJson(e)).toList();
    return Product(
      id: json["id"],
      name: json["name"],
      description: json["description"],
      price: json["price"],
      img: json["img"],
      isActive: json["isActive"],
      productVarietys: listProductVariety,
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "price": price,
        "img": img,
        "isActive": isActive,
        "productVarietys":
            List<dynamic>.from(productVarietys.map((x) => x.toJson())),
      };
}
