// To parse this JSON data, do
//
//     final invoiceCreateRes = invoiceCreateResFromJson(jsonString);

import 'dart:convert';

InvoiceCreateRes invoiceCreateResFromJson(String str) => InvoiceCreateRes.fromJson(json.decode(str));

String invoiceCreateResToJson(InvoiceCreateRes data) => json.encode(data.toJson());

class InvoiceCreateRes {
  InvoiceCreateRes({
    this.message,
    this.statusCode,
    this.data,
  });

  String? message;
  int? statusCode;
  Data? data;

  factory InvoiceCreateRes.fromJson(Map<String, dynamic> json) => InvoiceCreateRes(
    message: json["message"] == null ? null : json["message"],
    statusCode: json["status_code"] == null ? null : json["status_code"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "message": message == null ? null : message,
    "status_code": statusCode == null ? null : statusCode,
    "data": data == null ? null : data!.toJson(),
  };
}

class Data {
  Data({
    this.amount,
    this.vatWithoutAmount,
    this.litter,
    this.name,
    this.price,
    this.vat,
    this.adminId,
    this.userId,
    this.invoiceNo,
    this.updatedAt,
    this.createdAt,
    this.id,
  });

  int? amount;
  double? vatWithoutAmount;
  double? litter;
  String? name;
  double? price;
  int? vat;
  String? adminId;
  int? userId;
  int? invoiceNo;
  DateTime? updatedAt;
  DateTime? createdAt;
  int? id;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    amount: json["amount"] == null ? null : json["amount"],
    vatWithoutAmount: json["vatWithoutAmount"] == null ? null : json["vatWithoutAmount"].toDouble(),
    litter: json["litter"] == null ? null : json["litter"].toDouble(),
    name: json["name"] == null ? null : json["name"],
    price: json["price"] == null ? null : json["price"].toDouble(),
    vat: json["vat"] == null ? null : json["vat"],
    adminId: json["admin_id"] == null ? null : json["admin_id"],
    userId: json["user_id"] == null ? null : json["user_id"],
    invoiceNo: json["Invoice_No"] == null ? null : json["Invoice_No"],
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    id: json["id"] == null ? null : json["id"],
  );

  Map<String, dynamic> toJson() => {
    "amount": amount == null ? null : amount,
    "vatWithoutAmount": vatWithoutAmount == null ? null : vatWithoutAmount,
    "litter": litter == null ? null : litter,
    "name": name == null ? null : name,
    "price": price == null ? null : price,
    "vat": vat == null ? null : vat,
    "admin_id": adminId == null ? null : adminId,
    "user_id": userId == null ? null : userId,
    "Invoice_No": invoiceNo == null ? null : invoiceNo,
    "updated_at": updatedAt == null ? null : updatedAt!.toIso8601String(),
    "created_at": createdAt == null ? null : createdAt!.toIso8601String(),
    "id": id == null ? null : id,
  };
}
