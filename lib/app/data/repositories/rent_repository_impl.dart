import 'dart:developer';
import 'package:sazim_app/app/domain/entities/rent_entity.dart';

import '../../core/constant/end_points.dart';
import '../../core/networking/setup/base_client.dart';
import '../dto_model/rent_request_model.dart';
import '../models/rent_data_model.dart';
import '../../domain/repositories/rent_repository.dart';

class RentRepositoryImpl implements RentRepository {
  @override
  Future<List<RentEntity>> getAllRents() async {
    List<RentEntity> allRents = [];
    try {
      await BaseClient.safeApiCall(
        ApiUrls.rentals,
        RequestType.get,
        onSuccess: (response) {
          if (response.statusCode != 200) {
            throw Exception(response.data['error']);
          } else {
            allRents = List.from(response.data).map((e) => RentDataModel.fromJson(e).toEntity()).toList();
          }
        },
      );
    } catch (error) {
      log(error.toString());
      throw Exception(error.toString());
    }
    return allRents;
  }

  @override
  Future<RentEntity?> sendRentRequest({required RentRequestModel rentRequestModel}) async {
    RentEntity? rentEntity;
    try {
      await BaseClient.safeApiCall(
        ApiUrls.rentals,
        RequestType.post,
        data: rentRequestModel.toJson(),
        onSuccess: (response) {
          if (response.statusCode != 201) {
            throw Exception(response.data['error']);
          } else {
            rentEntity = RentDataModel.fromJson(response.data).toEntity();
          }
        },
      );
    } catch (error) {
      log(error.toString());
      throw Exception(error.toString());
    }
    return rentEntity;
  }
}
