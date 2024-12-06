import 'dart:developer';

import 'package:get/get.dart';
import 'package:sazim_app/app/core/services/auth_service.dart';
import 'package:sazim_app/app/data/repositories/category_repository_impl.dart';
import 'package:sazim_app/app/domain/repositories/product_management_repository.dart';

import '../../data/models/category_model.dart';
import '../../domain/entities/product_entity.dart';
import '../../domain/repositories/category_repository.dart';

class ProductManagementService extends GetxService {
  final ProductManagementRepository productManagementRepository;
  final CategoryRepository categoryRepository;
  final AuthService authService;

  ProductManagementService({required this.authService, required this.productManagementRepository, required this.categoryRepository});

  List<ProductEntity> allProducts = <ProductEntity>[].obs;
  List<ProductEntity> allProductsInShop = <ProductEntity>[].obs;
  List<ProductEntity> allProductsOfCurrentUser = <ProductEntity>[].obs;
  List<CategoryModel> listCategories = [];
  bool categoryLoaded = false;

  RxBool loading = true.obs;
  Map<String, String> categoryMap = {};

  Future<void> getAllCategories() async {
    try {
      if(listCategories.isEmpty)
        {
          await categoryRepository.getAllCategory().then(
                (value) {
              listCategories = value;
              for (var category in listCategories) {
                categoryMap.addAll({"${category.value}": "${category.label}"});
              }
              print(categoryMap);
              categoryLoaded = true;
            },
          );
        }
    } catch (error) {
      categoryLoaded = false;
      log("Error", error: error);
    }
  }

  Future<void> getAllUserProducts() async {
    loading.value = true;
    try {
      allProducts.clear();
      allProductsInShop.clear();
      allProductsOfCurrentUser.clear();
      await productManagementRepository.getAllProducts().then(
        (value) {
          loading.value = false;
          allProducts = value;

          /// we have all products now.. Lets sort them and fix them up

          for (var element in allProducts)
            {
              ProductEntity product = element;
              // Added the category label
              product.updateCategory(categoriesValues: getCategories(productEntity: element));

              if(product.seller == authService.userDataModel!.id)
                {
                  //Optimise reverse
                  allProductsOfCurrentUser.insert(0,product);
                }
              else
                {
                  allProductsInShop.insert(0,product);
                }
            }
        },
      );
    } catch (error) {
      log("Error", error: error);
    }
  }

  /// Get all label for a the selected categories
  List<String> getCategories({required ProductEntity productEntity}) {
    if (categoryLoaded) {
      List<String> selected = [];
      for (var category in productEntity.categories ?? []) {
        selected.add(categoryMap['$category'].toString());
      }
      return selected;
    } else {
      getAllCategories();
    }
    return [];
  }

  Future<void> updateProduct({required ProductEntity productEntity})async {
    await productManagementRepository.updateProduct(productEntity).then((value) {
      getAllUserProducts();
    },);
  }

  Future<void> deleteProduct({required String id})async{
   await productManagementRepository.deleteProduct(id);
   await getAllUserProducts();
  }
}
