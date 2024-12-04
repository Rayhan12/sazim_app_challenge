import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../core/services/product_creation_service.dart';
import '../../../routes/app_pages.dart';

class ProductDescriptionEnterController extends GetxController {

  final ProductCreationService productCreationService;
  ProductDescriptionEnterController({required this.productCreationService});

  final formKey = GlobalKey<FormState>();
  final descriptionController =  TextEditingController();

  @override
  void onInit() {
    descriptionController.text = productCreationService.description.value;
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    descriptionController.dispose();
    super.onClose();
  }

  void goToPreviousPage() {
    Get.back();
  }

  void saveDataAndGoToProductImagePicker() {
    // If current form is valid save and go to next page
    if(formKey.currentState!.validate())
    {
      productCreationService.updateProductDescription(description: descriptionController.text);
      Get.toNamed(Routes.PRODUCT_IMAGE_PICKER);
    }
  }

}
