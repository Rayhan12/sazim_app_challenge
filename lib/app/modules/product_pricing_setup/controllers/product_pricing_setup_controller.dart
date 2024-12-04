import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:sazim_app/app/routes/app_pages.dart';

import '../../../core/services/product_creation_service.dart';

class ProductPricingSetupController extends GetxController {
  final ProductCreationService productCreationService;

  ProductPricingSetupController({required this.productCreationService});

  final sellingPriceController = TextEditingController();
  final rentPriceController = TextEditingController();
  final rentTypeController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  void onInit() {
    sellingPriceController.text = productCreationService.sellingPrice.toString();
    rentPriceController.text = productCreationService.rentPrice.toString();
    rentTypeController.text = productCreationService.rentOption.toString();
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

  saveDataAndGoToProductSummary() {
    if (formKey.currentState!.validate()) {
      productCreationService.updateProductPricing(
        sellingPrice: double.parse(sellingPriceController.text),
        rentPrice: double.parse(rentPriceController.text),
        rentOption: rentTypeController.text,
      );
      Get.toNamed(Routes.PRODUCT_CREATION_SUMMARY);
    }
  }
}
