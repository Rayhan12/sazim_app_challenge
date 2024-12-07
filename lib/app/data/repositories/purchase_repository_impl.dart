import 'dart:developer';

import 'package:sazim_app/app/core/constant/end_points.dart';
import 'package:sazim_app/app/core/networking/setup/base_client.dart';
import 'package:sazim_app/app/data/dto_model/purchase_request_model.dart';
import 'package:sazim_app/app/data/models/purchase_data_model.dart';
import 'package:sazim_app/app/domain/entities/purchase_entity.dart';
import 'package:sazim_app/app/domain/repositories/purchase_repository.dart';

class PurchaseRepositoryImpl implements PurchaseRepository {
  @override
  Future<List<PurchasesEntity>> getAllPurchases() async {
    List<PurchasesEntity> allPurchases = [];
    try {
      await BaseClient.safeApiCall(
        ApiUrls.purchase,
        RequestType.get,
        onSuccess: (response) {
          if (response.statusCode != 200) {
            throw Exception(response.data['error']);
          } else {
            allPurchases = List.from(response.data).map((e) => PurchasesDataModel.fromJson(e).toEntity()).toList();
          }
        },
      );
    } catch (error) {
      log(error.toString());
      throw Exception(error.toString());
    }
    return allPurchases;
  }

  @override
  Future<PurchasesEntity?> sendPurchaseRequest({required PurchasesRequestModel purchasesRequestModel}) async {
    PurchasesEntity? purchasesEntity;
    try {
      await BaseClient.safeApiCall(
        ApiUrls.purchase,
        RequestType.post,
        data: purchasesRequestModel.toJson(),
        onSuccess: (response) {
          if (response.statusCode != 201) {
            throw Exception(response.data['error']);
          } else {
            purchasesEntity = PurchasesDataModel.fromJson(response.data).toEntity();
          }
        },
      );
    } catch (error) {
      log(error.toString());
      throw Exception(error.toString());
    }
    return purchasesEntity;
  }
}
