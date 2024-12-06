// To parse this JSON data, do
//
//     final categoryModel = categoryModelFromJson(jsonString);

import 'dart:convert';

List<CategoryModel> categoryModelFromJson(String str) => List<CategoryModel>.from(json.decode(str).map((x) => CategoryModel.fromJson(x)));

String categoryModelToJson(List<CategoryModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CategoryModel {
  String? value;
  String? label;

  CategoryModel({
    this.value,
    this.label,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
    value: json["value"],
    label: json["label"],
  );

  Map<String, dynamic> toJson() => {
    "value": value,
    "label": label,
  };

  @override
  bool operator ==(Object other) => identical(this, other) || other is CategoryModel && runtimeType == other.runtimeType && value == other.value && label == other.label;

  @override
  int get hashCode => value.hashCode ^ label.hashCode;
}
