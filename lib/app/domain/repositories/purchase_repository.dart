import 'package:sazim_app/app/data/dto_model/purchase_request_model.dart';

import '../entities/purchase_entity.dart';

abstract class PurchaseRepository{
  Future<List<PurchasesEntity>> getAllPurchases();
  Future<PurchasesEntity?> sendPurchaseRequest({required PurchasesRequestModel purchasesRequestModel});
}