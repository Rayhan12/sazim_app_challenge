import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:sazim_app/app/core/services/auth_service.dart';
import 'package:sazim_app/app/routes/app_pages.dart';

class HomeController extends GetxController {

  final PageController pageController = PageController(initialPage: 0);
  RxInt currentPage = 0.obs;


  @override
  void onInit() {

    pageController.addListener(() {
      currentPage.value = pageController.page!.toInt();
    });
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


}
