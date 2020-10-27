import 'dart:convert';

ProductVariety productVarietyFromJson(String str) =>
    ProductVariety.fromJson(json.decode(str));

String productVarietyToJson(ProductVariety data) => json.encode(data.toJson());

class ProductVariety {
  ProductVariety({
    this.id,
    this.description,
    this.isActive,
    this.name,
  });

  int id;
  String description;
  bool isActive;
  String name;

  factory ProductVariety.fromJson(Map<String, dynamic> json) => ProductVariety(
        id: json["id"],
        description: json["description"],
        isActive: json["isActive"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "description": description,
        "isActive": isActive,
        "name": name,
      };
}
