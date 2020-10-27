import 'dart:convert';

Deal dealFromJson(String str) => Deal.fromJson(json.decode(str));

String dealToJson(Deal data) => json.encode(data.toJson());

class Deal {
  Deal({
    this.id,
    this.status,
    this.timeofCreate,
  });

  int id;
  int status;
  DateTime timeofCreate;

  factory Deal.fromJson(Map<String, dynamic> json) => Deal(
        id: json["id"],
        status: json["status"],
        timeofCreate: DateTime.parse(json["timeofCreate"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "status": status,
        "timeofCreate": timeofCreate.toIso8601String(),
      };
}
