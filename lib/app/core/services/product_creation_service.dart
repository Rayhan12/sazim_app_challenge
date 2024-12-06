import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:sazim_app/app/core/services/auth_service.dart';
import 'package:sazim_app/app/data/models/category_model.dart';
import 'package:sazim_app/app/data/repositories/ProductManagementRepositoryImpl.dart';
import 'package:sazim_app/app/data/repositories/category_repository_impl.dart';
import 'package:sazim_app/app/domain/entities/product_entity.dart';
import 'package:sazim_app/app/modules/user_products/views/user_products_view.dart';

import '../../domain/repositories/category_repository.dart';
import '../../domain/repositories/product_management_repository.dart';

class ProductCreationService extends GetxService {
  final AuthService authService;
  final CategoryRepository categoryRepository;
  final ProductManagementRepository productManagementRepository;

  ProductCreationService({required this.categoryRepository, required this.authService, required this.productManagementRepository});

  RxString productTitle = "".obs;
  RxList<CategoryModel> categories = <CategoryModel>[].obs;
  RxString filePath = "".obs;
  RxString description = "".obs;
  RxDouble sellingPrice = 0.0.obs;
  RxDouble rentPrice = 0.0.obs;
  RxString rentOption = "".obs;

  int totalSteps = 5;
  RxInt currentStep = 1.obs;

  List<CategoryModel> listCategories = [];
  bool categoryLoaded = false;

  @override
  void onInit() {
    getAllCategories();
    super.onInit();
  }

  Future<void> getAllCategories() async {
    try {
      await categoryRepository.getAllCategory().then(
        (value) {
          listCategories = value;
          categoryLoaded = true;
        },
      );
    } catch (error) {
      categoryLoaded = false;
      log("Error", error: error);
    }
  }

  void updateProductTitle({required String productTitle}) {
    this.productTitle.value = productTitle;
  }

  void updateProductCategory({required List<CategoryModel> categories}) {
    this.categories.value = categories;
    print(categories);
  }

  void updateProductDescription({required String description}) {
    this.description.value = description;
  }

  void updateProductImage({required String filePath}) {
    this.filePath.value = filePath;
  }

  void updateProductPricing({
    required double sellingPrice,
    required double rentPrice,
    required String rentOption,
  }) {
    this.sellingPrice.value = sellingPrice;
    this.rentPrice.value = rentPrice;
    this.rentOption.value = rentOption;
  }

  void resetService() {
    productTitle = "".obs;
    categories = <CategoryModel>[].obs;
    filePath = "".obs;
    description = "".obs;
    sellingPrice = 0.0.obs;
    rentPrice = 0.0.obs;
    rentOption = "".obs;
    currentStep = 1.obs;
  }

  void setProgress({required int index}) {
    currentStep.value = index;
  }

  double getProgress() {
    return currentStep.value / totalSteps;
  }

  Future<void> createProduct() async {
    ProductEntity productEntity = ProductEntity(
      seller: authService.userDataModel!.id,
      categories: categories
          .map(
            (e) => e.value.toString(),
          ).toList(),
      productImage: filePath.value,
      description: description.value,
      purchasePrice: sellingPrice.value.toString(),
      rentPrice: rentPrice.value.toString(),
      rentOption: rentOption.value.toString(),
      title: productTitle.value.toString(),
    );

    try {
      await productManagementRepository.createProduct(productEntity);
    } catch (error) {
      log(error.toString(), error: error);
    }
  }

  @override
  String toString() {
    return 'ProductCreationService{productName: $productTitle, categories: $categories, filePath: $filePath, description: $description, sellingPrice: $sellingPrice, rentPrice: $rentPrice, rentOption: $rentOption}';
  }
}
