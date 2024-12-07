import 'package:sazim_app/app/domain/entities/product_entity.dart';

class RentEntity {
  int? id;
  int? renter;
  int? seller;
  int? product;
  String? rentOption;
  DateTime? rentPeriodStartDate;
  DateTime? rentPeriodEndDate;
  String? totalPrice;
  DateTime? rentDate;
  ProductEntity? productEntity;

  RentEntity({
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

  void setProductEntity({required ProductEntity product}){
    productEntity = product;
  }
}