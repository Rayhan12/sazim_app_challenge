import 'package:flutter/cupertino.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:get/get.dart';
import 'package:sazim_app/app/core/dependency_injection/dependency_injection.dart';
import 'package:sazim_app/app/core/services/product_creation_service.dart';
import 'package:sazim_app/app/core/services/product_management_service.dart';
import 'package:sazim_app/app/core/widgets/loading.dart';
import 'package:sazim_app/app/routes/app_pages.dart';

class ProductCreationSummaryController extends GetxController {

  final ProductCreationService productCreationService;
  final ProductManagementService productManagementService;
  ProductCreationSummaryController({required this.productCreationService, required this.productManagementService});

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    Loader.hide();
    super.onClose();
  }

  void goToPreviousPage() {
    Get.back();
  }

  Future<void> saveDataAndSubmitForProductCreation({required BuildContext context}) async{
    Loader.show(context,progressIndicator: const Loading());
    await productCreationService.createProduct();
    await productManagementService.getAllUserProducts();
    Loader.hide();
    // Returning home ==>  while dropping all routes until I reach home.
    // Get.offNamedUntil(Routes.HOME,ModalRoute.withName(Routes.HOME));
    Get.back();
    Get.back();
    Get.back();
    Get.back();
    Get.back();
    Get.back();
  }
}
