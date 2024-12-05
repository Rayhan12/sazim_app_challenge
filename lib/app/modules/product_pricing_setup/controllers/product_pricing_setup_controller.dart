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
  var index = 5;

  @override
  void onInit() {
    productCreationService.setProgress(index: index);
    if(productCreationService.sellingPrice.value != 0.0) {
      sellingPriceController.text = productCreationService.sellingPrice.toString();
    }
    if (productCreationService.rentPrice.value != 0.0) {
      rentPriceController.text = productCreationService.rentPrice.toString();
    }
    rentTypeController.text = productCreationService.rentOption.toString();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    sellingPriceController.dispose();
    rentTypeController.dispose();
    rentPriceController.dispose();
    super.onClose();
  }


  void goToPreviousPage() {
    productCreationService.setProgress(index: index-1);
    Get.back();
  }

  saveDataAndGoToProductSummary() {
    Get.focusScope?.unfocus();
    if (formKey.currentState!.validate()) {
      productCreationService.setProgress(index: index+1);
      productCreationService.updateProductPricing(
        sellingPrice: double.parse(sellingPriceController.text),
        rentPrice: double.parse(rentPriceController.text),
        rentOption: rentTypeController.text,
      );
      Get.toNamed(Routes.PRODUCT_CREATION_SUMMARY);
    }
  }
}
