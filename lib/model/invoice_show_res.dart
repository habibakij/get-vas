// To parse this JSON data, do
//
//     final invoiceShowRes = invoiceShowResFromJson(jsonString);

import 'dart:convert';

InvoiceShowRes invoiceShowResFromJson(String str) => InvoiceShowRes.fromJson(json.decode(str));

String invoiceShowResToJson(InvoiceShowRes data) => json.encode(data.toJson());

class InvoiceShowRes {
  InvoiceShowRes({
    this.message,
    this.statusCode,
    this.invoiceShow,
    this.adminInfo,
  });

  String? message;
  int? statusCode;
  InvoiceShow? invoiceShow;
  AdminInfo? adminInfo;

  factory InvoiceShowRes.fromJson(Map<String, dynamic> json) => InvoiceShowRes(
    message: json["message"] == null ? null : json["message"],
    statusCode: json["status_code"] == null ? null : json["status_code"],
    invoiceShow: json["InvoiceShow"] == null ? null : InvoiceShow.fromJson(json["InvoiceShow"]),
    adminInfo: json["adminInfo"] == null ? null : AdminInfo.fromJson(json["adminInfo"]),
  );

  Map<String, dynamic> toJson() => {
    "message": message == null ? null : message,
    "status_code": statusCode == null ? null : statusCode,
    "InvoiceShow": invoiceShow == null ? null : invoiceShow!.toJson(),
    "adminInfo": adminInfo == null ? null : adminInfo!.toJson(),
  };
}

class AdminInfo {
  AdminInfo({
    this.id,
    this.name,
    this.email,
    this.mobile,
    this.location,
    this.address,
    this.image,
    this.userType,
    this.adminId,
    this.emailVerifiedAt,
    this.lastLogin,
    this.status,
    this.userStatus,
    this.verifyCode,
    this.verifyExpiresAt,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? name;
  String? email;
  String? mobile;
  String? location;
  String? address;
  String? image;
  String? userType;
  dynamic adminId;
  dynamic emailVerifiedAt;
  dynamic lastLogin;
  String? status;
  String? userStatus;
  dynamic verifyCode;
  dynamic verifyExpiresAt;
  dynamic deletedAt;
  dynamic createdAt;
  DateTime? updatedAt;

  factory AdminInfo.fromJson(Map<String, dynamic> json) => AdminInfo(
    id: json["id"] == null ? null : json["id"],
    name: json["name"] == null ? null : json["name"],
    email: json["email"] == null ? null : json["email"],
    mobile: json["mobile"] == null ? null : json["mobile"],
    location: json["location"] == null ? null : json["location"],
    address: json["address"] == null ? null : json["address"],
    image: json["image"] == null ? null : json["image"],
    userType: json["user_type"] == null ? null : json["user_type"],
    adminId: json["admin_id"],
    emailVerifiedAt: json["email_verified_at"],
    lastLogin: json["last_login"],
    status: json["status"] == null ? null : json["status"],
    userStatus: json["user_status"] == null ? null : json["user_status"],
    verifyCode: json["verify_code"],
    verifyExpiresAt: json["verify_expires_at"],
    deletedAt: json["deleted_at"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "name": name == null ? null : name,
    "email": email == null ? null : email,
    "mobile": mobile == null ? null : mobile,
    "location": location == null ? null : location,
    "address": address == null ? null : address,
    "image": image == null ? null : image,
    "user_type": userType == null ? null : userType,
    "admin_id": adminId,
    "email_verified_at": emailVerifiedAt,
    "last_login": lastLogin,
    "status": status == null ? null : status,
    "user_status": userStatus == null ? null : userStatus,
    "verify_code": verifyCode,
    "verify_expires_at": verifyExpiresAt,
    "deleted_at": deletedAt,
    "created_at": createdAt,
    "updated_at": updatedAt == null ? null : updatedAt!.toIso8601String(),
  };
}

class InvoiceShow {
  InvoiceShow({
    this.id,
    this.amount,
    this.vatWithoutAmount,
    this.litter,
    this.name,
    this.price,
    this.vat,
    this.invoiceNo,
    this.adminId,
    this.userId,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  int? amount;
  double? vatWithoutAmount;
  String? litter;
  String? name;
  double? price;
  int? vat;
  String? invoiceNo;
  int? adminId;
  int? userId;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory InvoiceShow.fromJson(Map<String, dynamic> json) => InvoiceShow(
    id: json["id"] == null ? null : json["id"],
    amount: json["amount"] == null ? null : json["amount"],
    vatWithoutAmount: json["vatWithoutAmount"] == null ? null : json["vatWithoutAmount"].toDouble(),
    litter: json["litter"] == null ? null : json["litter"],
    name: json["name"] == null ? null : json["name"],
    price: json["price"] == null ? null : json["price"].toDouble(),
    vat: json["vat"] == null ? null : json["vat"],
    invoiceNo: json["invoice_No"] == null ? null : json["invoice_No"],
    adminId: json["admin_id"] == null ? null : json["admin_id"],
    userId: json["user_id"] == null ? null : json["user_id"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "amount": amount == null ? null : amount,
    "vatWithoutAmount": vatWithoutAmount == null ? null : vatWithoutAmount,
    "litter": litter == null ? null : litter,
    "name": name == null ? null : name,
    "price": price == null ? null : price,
    "vat": vat == null ? null : vat,
    "invoice_No": invoiceNo == null ? null : invoiceNo,
    "admin_id": adminId == null ? null : adminId,
    "user_id": userId == null ? null : userId,
    "created_at": createdAt == null ? null : createdAt!.toIso8601String(),
    "updated_at": updatedAt == null ? null : updatedAt!.toIso8601String(),
  };
}
