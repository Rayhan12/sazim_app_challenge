import 'package:get/get.dart';

import '../controllers/product_category_select_controller.dart';

class ProductCategorySelectBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductCategorySelectController>(
      () => ProductCategorySelectController(productCreationService: Get.find()),
    );
  }
}
