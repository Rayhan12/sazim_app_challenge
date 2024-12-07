import 'package:sazim_app/app/domain/entities/product_entity.dart';

class PurchasesEntity {
  int? id;
  int? buyer;
  int? seller;
  int? product;
  DateTime? purchaseDate;
  ProductEntity? productEntity;

  PurchasesEntity({
    this.id,
    this.buyer,
    this.seller,
    this.product,
    this.purchaseDate,
  });

  void setProductEntity({required ProductEntity product}){
    productEntity = product;
  }
}