import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:multi_dropdown/multi_dropdown.dart';
import 'package:sazim_app/app/core/services/product_creation_service.dart';
import 'package:sazim_app/app/data/models/category_model.dart';

import '../../../routes/app_pages.dart';

class ProductCategorySelectController extends GetxController {

  final ProductCreationService productCreationService;
  ProductCategorySelectController({required this.productCreationService});
  int index = 2;

  final categoryController = MultiSelectController<CategoryModel>();
  final formKey = GlobalKey<FormState>(debugLabel: "Category Form");

  @override
  void onInit() {
    productCreationService.setProgress(index: index);
    categoryController.addItems(productCreationService.categories.map((element) => DropdownItem<CategoryModel>(label: element.label.toString(), value: element,selected: true),).toList());
    if(!productCreationService.categoryLoaded) productCreationService.getAllCategories();
    super.onInit();
  }

  @override
  void onReady() {
    print("I am being called");
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void saveDataAndGoToProductDescription(){
    Get.focusScope?.unfocus();
    // If current form is valid save and go to next page
    if(formKey.currentState!.validate())
    {
      productCreationService.setProgress(index: index+1);
      //Convert to dynamic value
      productCreationService.updateProductCategory(categories: categoryController.selectedItems.map((e) => e.value).toList());
      Get.toNamed(Routes.PRODUCT_DESCRIPTION_ENTER);
    }
  }

  void goToPreviousPage(){
    productCreationService.setProgress(index: index-1);
    Get.back();
  }

  List<CategoryModel> getCategories(){
    if(productCreationService.categoryLoaded)
      {
        return productCreationService.listCategories;
      }
    return [];
  }


}
