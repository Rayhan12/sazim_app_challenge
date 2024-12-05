import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:sazim_app/app/core/services/product_creation_service.dart';
import 'package:sazim_app/app/routes/app_pages.dart';


class ProductManagementController extends GetxController {

  final ProductCreationService productCreationService;
  ProductManagementController({required this.productCreationService});

  final titleController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  int index = 1;

  @override
  void onInit() {
    productCreationService.setProgress(index: index);
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    titleController.dispose();
    productCreationService.resetService();
    super.onClose();
  }


  void saveDataAndGoToCategorySelection(){
    // If current form is valid save and go to next page
    Get.focusScope?.unfocus();
    if(formKey.currentState!.validate())
      {
        productCreationService.setProgress(index: index+1);
        productCreationService.updateProductTitle(productTitle: titleController.text);
        Get.toNamed(Routes.PRODUCT_CATEGORY_SELECT);
      }
  }


}
