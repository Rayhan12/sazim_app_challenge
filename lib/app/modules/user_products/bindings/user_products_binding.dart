import 'package:get/get.dart';
import 'package:sazim_app/app/core/services/auth_service.dart';
import 'package:sazim_app/app/core/services/product_management_service.dart';


import '../controllers/user_products_controller.dart';

class UserProductsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserProductsController>(
      () => UserProductsController(authService: Get.find<AuthService>() ,productManagementService: Get.find<ProductManagementService>()),
    );
  }
}
