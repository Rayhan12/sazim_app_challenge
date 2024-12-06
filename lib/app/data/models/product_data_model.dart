// To parse this JSON data, do
//
//     final productDataModel = productDataModelFromJson(jsonString);

import 'dart:convert';

import 'package:sazim_app/app/domain/entities/product_entity.dart';

List<ProductDataModel> productDataModelFromJson(String str) => List<ProductDataModel>.from(json.decode(str).map((x) => ProductDataModel.fromJson(x)));

String productDataModelToJson(List<ProductDataModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductDataModel {
  int? id;
  int? seller;
  String? title;
  String? description;
  List<String>? categories;
  String? productImage;
  String? purchasePrice;
  String? rentPrice;
  String? rentOption;
  DateTime? datePosted;

  ProductDataModel({
    this.id,
    this.seller,
    this.title,
    this.description,
    this.categories,
    this.productImage,
    this.purchasePrice,
    this.rentPrice,
    this.rentOption,
    this.datePosted,
  });

  factory ProductDataModel.fromJson(Map<String, dynamic> json) => ProductDataModel(
    id: json["id"],
    seller: json["seller"],
    title: json["title"],
    description: json["description"],
    categories: json["categories"] == null ? [] : List<String>.from(json["categories"]!.map((x) => x)),
    productImage: json["product_image"],
    purchasePrice: json["purchase_price"],
    rentPrice: json["rent_price"],
    rentOption: json["rent_option"],
    datePosted: json["date_posted"] == null ? null : DateTime.parse(json["date_posted"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "seller": seller,
    "title": title,
    "description": description,
    "categories": categories == null ? [] : List<dynamic>.from(categories!.map((x) => x)),
    "product_image": productImage,
    "purchase_price": purchasePrice,
    "rent_price": rentPrice,
    "rent_option": rentOption,
    "date_posted": datePosted?.toIso8601String(),
  };

  ProductEntity toProductEntity(){
    return ProductEntity(
      id: id ,
      title: title,
      categories: categories,
      datePosted: datePosted,
      description: description,
      productImage: productImage,
      purchasePrice: purchasePrice,
      rentOption: rentOption,
      rentPrice: rentPrice,
      seller: seller,
    );
  }

  factory ProductDataModel.fromEntity({required ProductEntity productEntity}){
    return ProductDataModel(
      id: productEntity.id,
      title: productEntity.title,
      seller: productEntity.seller,
      rentPrice: productEntity.rentPrice,
      rentOption: productEntity.rentOption,
      purchasePrice: productEntity.purchasePrice,
      productImage: productEntity.productImage,
      description: productEntity.description,
      datePosted: productEntity.datePosted,
      categories: productEntity.categories,
    );
  }
}
