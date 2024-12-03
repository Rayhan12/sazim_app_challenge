import 'package:get/get.dart';

import '../controllers/product_pricing_setup_controller.dart';

class ProductPricingSetupBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductPricingSetupController>(
      () => ProductPricingSetupController(productCreationService: Get.find()),
    );
  }
}
