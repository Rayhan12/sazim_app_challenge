// To parse this JSON data, do
//
//     final userRegisterModel = userRegisterModelFromJson(jsonString);

import 'dart:convert';

UserRegisterModel userRegisterModelFromJson(String str) => UserRegisterModel.fromJson(json.decode(str));

String userRegisterModelToJson(UserRegisterModel data) => json.encode(data.toJson());

class UserRegisterModel {
  String? email;
  String? firstName;
  String? lastName;
  String? address;
  String? firebaseConsoleManagerToken;
  String? password;

  UserRegisterModel({
    this.email,
    this.firstName,
    this.lastName,
    this.address,
    this.firebaseConsoleManagerToken,
    this.password,
  });

  factory UserRegisterModel.fromJson(Map<String, dynamic> json) => UserRegisterModel(
    email: json["email"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    address: json["address"],
    firebaseConsoleManagerToken: json["firebase_console_manager_token"],
    password: json["password"],
  );

  Map<String, dynamic> toJson() => {
    "email": email,
    "first_name": firstName,
    "last_name": lastName,
    "address": address,
    "firebase_console_manager_token": firebaseConsoleManagerToken,
    "password": password,
  };
}
