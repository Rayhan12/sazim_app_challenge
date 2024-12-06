import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:sazim_app/app/core/dependency_injection/dependency_injection.dart';
import 'package:sazim_app/app/core/services/auth_service.dart';
import 'package:sazim_app/app/routes/app_pages.dart';

import '../../../core/services/product_management_service.dart';
import '../../shop/controllers/shop_controller.dart';
import '../../user_products/controllers/user_products_controller.dart';

class HomeController extends GetxController {

  final AuthService authService;
  HomeController({required this.authService});


  final PageController pageController = PageController(initialPage: 0);
  RxInt currentPage = 0.obs;


  @override
  void onInit() {
    pageController.addListener(() {
      currentPage.value = pageController.page!.toInt();
    });
    Get.lazyPut<UserProductsController>(() => UserProductsController(authService: Get.find<AuthService>() ,productManagementService: Get.find<ProductManagementService>()),fenix: true);
    Get.lazyPut<ShopController>(() => ShopController(authService: Get.find<AuthService>() ,productManagementService: Get.find<ProductManagementService>()),fenix: true);

    super.onInit();
  }

  @override
  void onReady() {
    DependencyInjection.init();
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void updatePage(int index){
    print(index);
    if(index<=2) {
      pageController.animateToPage(index, duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
    }
    else
      {
        Get.toNamed(Routes.PRODUCT_MANAGEMENT);
      }

  }

  void logOutUserAndSendToLogin(){
    ///Implementation not with the scope but setup is ready
    authService.logOut();
    Get.offAllNamed(Routes.LOGIN);
  }


}
