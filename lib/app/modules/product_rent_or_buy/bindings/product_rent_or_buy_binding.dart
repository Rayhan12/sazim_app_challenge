import 'package:get/get.dart';
import 'package:sazim_app/app/core/services/product_management_service.dart';

import '../controllers/product_rent_or_buy_controller.dart';

class ProductRentOrBuyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductRentOrBuyController>(
      () => ProductRentOrBuyController(productManagementService: Get.find<ProductManagementService>()),
    );
  }
}
