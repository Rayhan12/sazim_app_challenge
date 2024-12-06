import 'package:get/get.dart';
import 'package:sazim_app/app/core/services/product_management_service.dart';

import '../controllers/edit_product_controller.dart';

class EditProductBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditProductController>(
      () => EditProductController(productManagementService: Get.find<ProductManagementService>()),
    );
  }
}
