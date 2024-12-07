// To parse this JSON data, do
//
//     final rentDataModel = rentDataModelFromJson(jsonString);

import 'dart:convert';

import '../../domain/entities/rent_entity.dart';

List<RentDataModel> rentDataModelFromJson(String str) => List<RentDataModel>.from(json.decode(str).map((x) => RentDataModel.fromJson(x)));

String rentDataModelToJson(List<RentDataModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class RentDataModel {
  int? id;
  int? renter;
  int? seller;
  int? product;
  String? rentOption;
  DateTime? rentPeriodStartDate;
  DateTime? rentPeriodEndDate;
  String? totalPrice;
  DateTime? rentDate;

  RentDataModel({
    this.id,
    this.renter,
    this.seller,
    this.product,
    this.rentOption,
    this.rentPeriodStartDate,
    this.rentPeriodEndDate,
    this.totalPrice,
    this.rentDate,
  });

  factory RentDataModel.fromJson(Map<String, dynamic> json) => RentDataModel(
    id: json["id"],
    renter: json["renter"],
    seller: json["seller"],
    product: json["product"],
    rentOption: json["rent_option"],
    rentPeriodStartDate: json["rent_period_start_date"] == null ? null : DateTime.parse(json["rent_period_start_date"]),
    rentPeriodEndDate: json["rent_period_end_date"] == null ? null : DateTime.parse(json["rent_period_end_date"]),
    totalPrice: json["total_price"],
    rentDate: json["rent_date"] == null ? null : DateTime.parse(json["rent_date"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "renter": renter,
    "seller": seller,
    "product": product,
    "rent_option": rentOption,
    "rent_period_start_date": rentPeriodStartDate?.toIso8601String(),
    "rent_period_end_date": rentPeriodEndDate?.toIso8601String(),
    "total_price": totalPrice,
    "rent_date": rentDate?.toIso8601String(),
  };

  RentEntity toEntity() {
    return RentEntity(
      id: id,
      renter: renter,
      seller: seller,
      product: product,
      rentOption: rentOption,
      rentPeriodStartDate: rentPeriodStartDate,
      rentPeriodEndDate: rentPeriodEndDate,
      totalPrice: totalPrice,
      rentDate: rentDate,
    );
  }

  factory RentDataModel.fromEntity(RentEntity rentEntity) {
    return RentDataModel(
      id: rentEntity.id,
      renter: rentEntity.renter,
      seller: rentEntity.seller,
      product: rentEntity.product,
      rentOption: rentEntity.rentOption,
      rentPeriodStartDate: rentEntity.rentPeriodStartDate,
      rentPeriodEndDate: rentEntity.rentPeriodEndDate,
      totalPrice: rentEntity.totalPrice,
      rentDate: rentEntity.rentDate,
    );
  }
}
