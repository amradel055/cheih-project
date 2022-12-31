// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';
UserModel userFromJson(String str) => UserModel.fromJson(json.decode(str));

String userToJson(UserModel data) => json.encode(data.toJson());
class UserModel {


  UserModel({
    this.type,
    this.branchId,
    this.companyId,
    this.createdBy,
    this.createdDate,
    this.id,
    this.index,
    this.markEdit,
    this.inventoryId,
    this.name,
    this.password,
    this.userCode,
  });

  String ?type;
  int ?branchId;
  int ?companyId;
  int ?createdBy;
  DateTime? createdDate;
  int ?id;
  int ?index;
  bool ?markEdit;
  int ?inventoryId;
  String? name;
  String? password;
  String? userCode;

  factory UserModel.fromRawJson(String str) => UserModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    type: json["type"] == null ? null : json["type"],
    branchId: json["branchId"] == null ? null : json["branchId"],
    companyId: json["companyId"] == null ? null : json["companyId"],
    createdBy: json["createdBy"] == null ? null : json["createdBy"],
    createdDate: json["createdDate"] == null ? null : DateTime.parse(json["createdDate"]),
    id: json["id"] == null ? null : json["id"],
    index: json["index"] == null ? null : json["index"],
    markEdit: json["markEdit"] == null ? null : json["markEdit"],
    inventoryId: json["inventoryId"] == null ? null : json["inventoryId"],
    name: json["name"] == null ? null : json["name"],
    password: json["password"] == null ? null : json["password"],
    userCode: json["userCode"] == null ? null : json["userCode"],
  );

  Map<String, dynamic> toJson() => {
    "type": type == null ? null : type,
    "branchId": branchId == null ? null : branchId,
    "companyId": companyId == null ? null : companyId,
    "createdBy": createdBy == null ? null : createdBy,
    "createdDate": createdDate == null ? null : createdDate!.toIso8601String(),
    "id": id == null ? null : id,
    "index": index == null ? null : index,
    "markEdit": markEdit == null ? null : markEdit,
    "inventoryId": inventoryId == null ? null : inventoryId,
    "name": name == null ? null : name,
    "password": password == null ? null : password,
    "userCode": userCode == null ? null : userCode,
  };
}
