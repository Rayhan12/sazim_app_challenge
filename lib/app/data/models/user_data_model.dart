// To parse this JSON data, do
//
//     final userDataModel = userDataModelFromJson(jsonString);

import 'dart:convert';

UserDataModel userDataModelFromJson(String str) => UserDataModel.fromJson(json.decode(str));

String userDataModelToJson(UserDataModel data) => json.encode(data.toJson());

class UserDataModel {
  int? id;
  String? email;
  String? firstName;
  String? lastName;
  String? address;
  String? firebaseConsoleManagerToken;
  String? password;
  DateTime? dateJoined;

  UserDataModel({
    this.id,
    this.email,
    this.firstName,
    this.lastName,
    this.address,
    this.firebaseConsoleManagerToken,
    this.password,
    this.dateJoined,
  });

  factory UserDataModel.fromJson(Map<String, dynamic> json) => UserDataModel(
    id: json["id"],
    email: json["email"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    address: json["address"],
    firebaseConsoleManagerToken: json["firebase_console_manager_token"],
    password: json["password"],
    dateJoined: json["date_joined"] == null ? null : DateTime.parse(json["date_joined"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "email": email,
    "first_name": firstName,
    "last_name": lastName,
    "address": address,
    "firebase_console_manager_token": firebaseConsoleManagerToken,
    "password": password,
    "date_joined": dateJoined?.toIso8601String(),
  };

  @override
  String toString() {
    return 'UserDataModel{id: $id, email: $email, firstName: $firstName, lastName: $lastName, address: $address, firebaseConsoleManagerToken: $firebaseConsoleManagerToken, password: $password, dateJoined: $dateJoined}';
  }
}
