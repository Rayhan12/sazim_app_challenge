import 'package:get/get.dart';

import '../../../core/services/auth_service.dart';
import '../../../core/services/product_management_service.dart';
import '../../../domain/entities/product_entity.dart';
import '../../../routes/app_pages.dart';

class ShopController extends GetxController {
  final AuthService authService;
  final ProductManagementService productManagementService;
  ShopController({required this.authService , required this.productManagementService});

  @override
  void onInit() {
    if(productManagementService.allProductsInShop.isEmpty)
      {
        productManagementService.getAllUserProducts();
      }
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void goToRentOrBuyProduct({required ProductEntity productEntity}) => Get.toNamed(Routes.EDIT_PRODUCT,arguments: productEntity);

}
