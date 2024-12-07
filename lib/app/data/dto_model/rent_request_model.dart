// To parse this JSON data, do
//
//     final rentRequestModel = rentRequestModelFromJson(jsonString);

import 'dart:convert';

RentRequestModel rentRequestModelFromJson(String str) => RentRequestModel.fromJson(json.decode(str));

String rentRequestModelToJson(RentRequestModel data) => json.encode(data.toJson());

class RentRequestModel {
  int? renter;
  int? product;
  String? rentOption;
  DateTime? rentPeriodStartDate;
  DateTime? rentPeriodEndDate;

  RentRequestModel({
    this.renter,
    this.product,
    this.rentOption,
    this.rentPeriodStartDate,
    this.rentPeriodEndDate,
  });

  factory RentRequestModel.fromJson(Map<String, dynamic> json) => RentRequestModel(
    renter: json["renter"],
    product: json["product"],
    rentOption: json["rent_option"],
    rentPeriodStartDate: json["rent_period_start_date"] == null ? null : DateTime.parse(json["rent_period_start_date"]),
    rentPeriodEndDate: json["rent_period_end_date"] == null ? null : DateTime.parse(json["rent_period_end_date"]),
  );

  Map<String, dynamic> toJson() => {
    "renter": renter,
    "product": product,
    "rent_option": rentOption,
    "rent_period_start_date": rentPeriodStartDate?.toIso8601String(),
    "rent_period_end_date": rentPeriodEndDate?.toIso8601String(),
  };
}
