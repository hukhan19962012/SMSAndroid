import 'dart:convert';

import 'package:SMSAndroid/models/deal.dart';
import 'package:SMSAndroid/models/seller.dart';

Group groupFromJson(String str) => Group.fromJson(json.decode(str));

String groupToJson(Group data) => json.encode(data.toJson());

class Group {
  Group({
    this.id,
    this.name,
    this.description,
    this.img,
    this.isActive,
    this.deals,
    this.sellers,
  });

  int id;
  String name;
  String description;
  String img;
  bool isActive;
  List<Deal> deals;
  List<Seller> sellers;

  factory Group.fromJson(Map<String, dynamic> json) => Group(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        img: json["img"],
        isActive: json["isActive"],
        deals: List<Deal>.from(json["deals"].map((x) => Deal.fromJson(x))),
        sellers:
            List<Seller>.from(json["sellers"].map((x) => Seller.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "img": img,
        "isActive": isActive,
        "deals": List<dynamic>.from(deals.map((x) => x.toJson())),
        "sellers": List<dynamic>.from(sellers.map((x) => x.toJson())),
      };
}
