

import '../../data/dto_model/rent_request_model.dart';
import '../entities/rent_entity.dart';

abstract class RentRepository{
  Future<List<RentEntity>> getAllRents();
  Future<RentEntity?> sendRentRequest({required RentRequestModel rentRequestModel});
}