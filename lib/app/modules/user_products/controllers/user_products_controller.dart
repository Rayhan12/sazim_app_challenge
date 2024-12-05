import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:sazim_app/app/routes/app_pages.dart';

class UserProductsController extends GetxController {

  final ScrollController scrollController = ScrollController();
  final sliverAppBar = GlobalKey();
  final sliverKey = GlobalKey<SliverAnimatedListState>();

  @override
  void onInit() {
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

  void goToEditProduct() => Get.toNamed(Routes.EDIT_PRODUCT);

}
