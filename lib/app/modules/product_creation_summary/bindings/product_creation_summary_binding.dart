import 'package:get/get.dart';
import 'package:sazim_app/app/core/services/product_creation_service.dart';

import '../controllers/product_creation_summary_controller.dart';

class ProductCreationSummaryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductCreationSummaryController>(
      () => ProductCreationSummaryController(productCreationService: Get.find<ProductCreationService>(),),
    );
  }
}
