import 'dart:convert';

import 'package:SMSAndroid/models/deal.dart';

Seller sellerFromJson(String str) => Seller.fromJson(json.decode(str));

String sellerToJson(Seller data) => json.encode(data.toJson());

class Seller {
  Seller({
    this.id,
    this.name,
    this.img,
    this.deals,
    this.email,
    this.birthDate,
    this.address,
    this.phone,
    this.isActive,
  });

  int id;
  String name;
  String img;
  List<Deal> deals;
  String email;
  DateTime birthDate;
  String address;
  String phone;
  bool isActive;

  factory Seller.fromJson(Map<String, dynamic> json) => Seller(
        id: json["id"],
        name: json["name"],
        img: json["img"],
        deals: List<Deal>.from(json["deals"].map((x) => Deal.fromJson(x))),
        email: json["email"],
        birthDate: DateTime.parse(json["birthDate"]),
        address: json["address"],
        phone: json["phone"],
        isActive: json["isActive"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "img": img,
        "deals": List<dynamic>.from(deals.map((x) => x.toJson())),
        "email": email,
        "birthDate": birthDate.toIso8601String(),
        "address": address,
        "phone": phone,
        "isActive": isActive,
      };
}
