import 'package:flutter/cupertino.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:get/get.dart';
import 'package:sazim_app/app/core/services/product_creation_service.dart';
import 'package:sazim_app/app/core/widgets/loading.dart';
import 'package:sazim_app/app/routes/app_pages.dart';

class ProductCreationSummaryController extends GetxController {

  final ProductCreationService productCreationService;
  ProductCreationSummaryController({required this.productCreationService});

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
    super.onClose();
  }

  void goToPreviousPage() {
    Get.back();
  }

  saveDataAndSubmitForProductCreation({required BuildContext context}) {
    Loader.show(context,progressIndicator: const Loading());
    productCreationService.createProduct().then((value) {
      Loader.hide();
      // Returning home ==>  while dropping all routes until I reach home.
      Get.offNamedUntil(Routes.HOME,ModalRoute.withName(Routes.HOME));
    },);
  }
}
