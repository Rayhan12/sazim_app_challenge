import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sazim_app/app/core/custom_controllers/file_upload_controller.dart';

import '../../../core/services/product_creation_service.dart';
import '../../../routes/app_pages.dart';

class ProductImagePickerController extends GetxController {

  final ProductCreationService productCreationService;
  ProductImagePickerController({required this.productCreationService});

  final fileUploadController = FileUploaderController();
  RxBool showError = false.obs;

  int index = 4;

  @override
  void onInit() {
    fileUploadController.setImageFile(selectedFile: XFile(productCreationService.filePath.value));
    super.onInit();
  }

  @override
  void onReady() {
    productCreationService.setProgress(index: index);
    super.onReady();
  }

  @override
  void onClose() {
    fileUploadController.clearController();
    super.onClose();
  }

  void goToPreviousPage() {
    productCreationService.setProgress(index: index-1);
    Get.back();
  }

  void saveDataAndGoToProductPricing() {
    // If current form is valid save and go to next page
    Get.focusScope?.unfocus();
    if(fileUploadController.hasImageFile())
    {
      productCreationService.setProgress(index: index+1);
      showError.value = false;
      productCreationService.updateProductImage(filePath: fileUploadController.imageFile.path);
      Get.toNamed(Routes.PRODUCT_PRICING_SETUP);
    }
    else
      {
        showError.value = true;
      }

  }
}
