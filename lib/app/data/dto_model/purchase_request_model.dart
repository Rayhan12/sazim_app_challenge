// To parse this JSON data, do
//
//     final purchasesRequestModel = purchasesRequestModelFromJson(jsonString);

import 'dart:convert';

PurchasesRequestModel purchasesRequestModelFromJson(String str) => PurchasesRequestModel.fromJson(json.decode(str));

String purchasesRequestModelToJson(PurchasesRequestModel data) => json.encode(data.toJson());

class PurchasesRequestModel {
  int? buyer;
  int? product;

  PurchasesRequestModel({
    this.buyer,
    this.product,
  });

  factory PurchasesRequestModel.fromJson(Map<String, dynamic> json) => PurchasesRequestModel(
    buyer: json["buyer"],
    product: json["product"],
  );

  Map<String, dynamic> toJson() => {
    "buyer": buyer,
    "product": product,
  };
}
