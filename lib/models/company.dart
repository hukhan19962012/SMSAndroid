import 'dart:convert';

import 'package:SMSAndroid/models/product.dart';

Company companyFromJson(String str) => Company.fromJson(json.decode(str));

String companyToJson(Company data) => json.encode(data.toJson());

class Company {
  Company({
    this.id,
    this.name,
    this.description,
    this.img,
    this.isActive,
    this.products,
  });

  int id;
  String name;
  String description;
  String img;
  bool isActive;
  List<Product> products;

  factory Company.fromJson(Map<String, dynamic> json) => Company(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        img: json["img"],
        isActive: json["isActive"],
        products: List<Product>.from(
            json["products"].map((x) => Product.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "img": img,
        "isActive": isActive,
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
      };
}
