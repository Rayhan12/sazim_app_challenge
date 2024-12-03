import 'package:get/get.dart';

import '../controllers/product_description_enter_controller.dart';

class ProductDescriptionEnterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductDescriptionEnterController>(
      () => ProductDescriptionEnterController(productCreationService: Get.find()),
    );
  }
}
