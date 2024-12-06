import 'package:sazim_app/app/data/models/category_model.dart';

abstract class CategoryRepository{
  Future<List<CategoryModel>> getAllCategory();
}