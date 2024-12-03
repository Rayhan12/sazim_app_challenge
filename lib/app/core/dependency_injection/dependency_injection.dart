import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sazim_app/app/core/services/product_creation_service.dart';
import 'package:sazim_app/app/modules/home/controllers/home_controller.dart';
import 'package:sazim_app/app/modules/product_management/controllers/product_management_controller.dart';
import 'package:sazim_app/app/modules/user_products/controllers/user_products_controller.dart';

class DependencyInjection{
  static void init(){

   ///Register Repository


    /// Register Services
    Get.put<ProductCreationService>(ProductCreationService(),permanent: true);

    /// Register Controllers
    // Get.lazyPut<UserProductsController>(() => UserProductsController());
    Get.put<HomeController>(HomeController(),permanent: true);
    Get.put<UserProductsController>(UserProductsController(), permanent: true);

  }
}