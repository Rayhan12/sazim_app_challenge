import 'package:get/get.dart';

import '../controllers/product_creation_summary_controller.dart';

class ProductCreationSummaryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductCreationSummaryController>(
      () => ProductCreationSummaryController(productCreationService: Get.find()),
    );
  }
}
