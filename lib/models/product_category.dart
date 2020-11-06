import 'package:SMSAndroid/models/product.dart';

class ProductCategory {
  ProductCategory({
    this.id,
    this.name,
    this.description,
    this.isActive,
    this.img,
  });

  int id;
  String name;
  String description;
  bool isActive;
  String img;

  factory ProductCategory.fromJson(Map<String, dynamic> json) =>
      ProductCategory(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        isActive: json["isActive"],
        img: json["img"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "isActive": isActive,
        "img": img,
      };
}
