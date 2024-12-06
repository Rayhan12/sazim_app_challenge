import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:sazim_app/app/core/services/auth_service.dart';
import 'package:sazim_app/app/core/services/product_creation_service.dart';
import 'package:sazim_app/app/core/services/product_management_service.dart';
import 'package:sazim_app/app/data/repositories/category_repository_impl.dart';
import 'package:sazim_app/app/domain/entities/product_entity.dart';
import 'package:sazim_app/app/domain/repositories/product_management_repository.dart';
import 'package:sazim_app/app/routes/app_pages.dart';

class UserProductsController extends GetxController {

  final AuthService authService;
  final ProductManagementService productManagementService;
  UserProductsController({required this.authService, required this.productManagementService});

  final ScrollController scrollController = ScrollController();
  final sliverAppBar = GlobalKey();
  final sliverKey = GlobalKey<SliverAnimatedListState>();


  @override
  void onInit() {
    productManagementService.getAllCategories();
    productManagementService.getAllUserProducts();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }


  String getFirstName (){
    return authService.userDataModel!.firstName ?? "";
  }


  void goToEditProduct({required ProductEntity productEntity}) => Get.toNamed(Routes.EDIT_PRODUCT,arguments: productEntity);

}
