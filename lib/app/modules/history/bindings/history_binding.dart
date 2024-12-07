import 'package:get/get.dart';
import 'package:sazim_app/app/core/services/product_management_service.dart';

import '../controllers/history_controller.dart';

class HistoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HistoryController>(
      () => HistoryController(productManagementService: Get.find<ProductManagementService>()),
    );
  }
}
