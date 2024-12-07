// To parse this JSON data, do
//
//     final purchasesDataModel = purchasesDataModelFromJson(jsonString);

import 'dart:convert';

import 'package:sazim_app/app/domain/entities/purchase_entity.dart';

List<PurchasesDataModel> purchasesDataModelFromJson(String str) => List<PurchasesDataModel>.from(json.decode(str).map((x) => PurchasesDataModel.fromJson(x)));

String purchasesDataModelToJson(List<PurchasesDataModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PurchasesDataModel {
  int? id;
  int? buyer;
  int? seller;
  int? product;
  DateTime? purchaseDate;

  PurchasesDataModel({
    this.id,
    this.buyer,
    this.seller,
    this.product,
    this.purchaseDate,
  });

  factory PurchasesDataModel.fromJson(Map<String, dynamic> json) => PurchasesDataModel(
    id: json["id"],
    buyer: json["buyer"],
    seller: json["seller"],
    product: json["product"],
    purchaseDate: json["purchase_date"] == null ? null : DateTime.parse(json["purchase_date"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "buyer": buyer,
    "seller": seller,
    "product": product,
    "purchase_date": purchaseDate?.toIso8601String(),
  };

  PurchasesEntity toEntity(){
    return PurchasesEntity(
      product: product,
      buyer: buyer,
      seller: seller,
      id: id,
      purchaseDate: purchaseDate,
    );
  }

  factory PurchasesDataModel.fromEntity({required PurchasesEntity purchasesEntity}){
    return PurchasesDataModel(
      id: purchasesEntity.id,
      seller: purchasesEntity.seller,
      buyer: purchasesEntity.buyer,
      product: purchasesEntity.product,
      purchaseDate: purchasesEntity.purchaseDate
    );
  }
}
