// To parse this JSON data, do
//
//     final showOilInfo = showOilInfoFromJson(jsonString);

import 'dart:convert';

ShowOilInfoModel showOilInfoFromJson(String str) => ShowOilInfoModel.fromJson(json.decode(str));

String showOilInfoToJson(ShowOilInfoModel data) => json.encode(data.toJson());

class ShowOilInfoModel {
  ShowOilInfoModel({
    this.message,
    this.data,
  });

  String? message;
  List<Datum>? data;

  factory ShowOilInfoModel.fromJson(Map<String, dynamic> json) => ShowOilInfoModel(
    message: json["message"] == null ? null : json["message"],
    data: json["data"] == null ? null : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "message": message == null ? null : message,
    "data": data == null ? null : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    this.id,
    this.name,
    this.price,
    this.vat,
    this.adminId,
    this.createdAt,
    this.updatedAt,
  });

  int ?id;
  String? name;
  double ?price;
  int ?vat;
  int ?adminId;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"] == null ? null : json["id"],
    name: json["name"] == null ? null : json["name"],
    price: json["price"] == null ? null : json["price"].toDouble(),
    vat: json["vat"] == null ? null : json["vat"],
    adminId: json["admin_id"] == null ? null : json["admin_id"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "name": name == null ? null : name,
    "price": price == null ? null : price,
    "vat": vat == null ? null : vat,
    "admin_id": adminId == null ? null : adminId,
    "created_at": createdAt == null ? null : createdAt!.toIso8601String(),
    "updated_at": updatedAt == null ? null : updatedAt!.toIso8601String(),
  };
}
