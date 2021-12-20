// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  LoginModel({
    this.message,
    this.accessToken,
    this.userData,
  });

  String? message;
  String ?accessToken;
  UserData? userData;

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
    message: json["message"] == null ? null : json["message"],
    accessToken: json["access_token"] == null ? null : json["access_token"],
    userData: json["userData"] == null ? null : UserData.fromJson(json["userData"]),
  );

  Map<String, dynamic> toJson() => {
    "message": message == null ? null : message,
    "access_token": accessToken == null ? null : accessToken,
    "userData": userData == null ? null : userData!.toJson(),
  };
}

class UserData {
  UserData({
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

  int ? id;
  String? name;
  String ?email;
  String ?mobile;
  String ?location;
  String ?address;
  dynamic? image;
  String ?userType;
  String ?adminId;
  dynamic? emailVerifiedAt;
  dynamic ?lastLogin;
  String ?status;
  String ?userStatus;
  dynamic ?verifyCode;
  dynamic ?verifyExpiresAt;
  dynamic ?deletedAt;
  dynamic ?createdAt;
  DateTime? updatedAt;

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
    id: json["id"] == null ? null : json["id"],
    name: json["name"] == null ? null : json["name"],
    email: json["email"] == null ? null : json["email"],
    mobile: json["mobile"] == null ? null : json["mobile"],
    location: json["location"] == null ? null : json["location"],
    address: json["address"] == null ? null : json["address"],
    image: json["image"],
    userType: json["user_type"] == null ? null : json["user_type"],
    adminId: json["admin_id"] == null ? null : json["admin_id"],
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
    "image": image,
    "user_type": userType == null ? null : userType,
    "admin_id": adminId == null ? null : adminId,
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
