import 'dart:developer';

import 'package:sazim_app/app/data/models/category_model.dart';
import 'package:sazim_app/app/domain/repositories/category_repository.dart';

import '../../core/constant/end_points.dart';
import '../../core/networking/setup/base_client.dart';

class CategoryRepositoryImpl implements CategoryRepository{
  @override
  Future<List<CategoryModel>> getAllCategory() async{
    List<CategoryModel> categoryList = [];
    try {
      await BaseClient.safeApiCall(
        ApiUrls.getCategory,
        RequestType.get,
        onSuccess: (response){
          if(response.statusCode != 200)
          {
            throw Exception(response.data['error']);
          }
          else
          {
            categoryList = List.from(response.data).map((e) => CategoryModel.fromJson(e),).toList();
          }
        },
      );
    } catch (error) {
      log(error.toString());
      throw Exception(error.toString());
    }
    return categoryList;
  }
}