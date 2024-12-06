import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:sazim_app/app/core/services/auth_service.dart';
import 'package:sazim_app/app/domain/repositories/product_management_repository.dart';
import 'package:sazim_app/app/routes/app_pages.dart';

class UserProductsController extends GetxController {

  final AuthService authService;
  final ProductManagementRepository productManagementRepository;
  UserProductsController({required this.authService, required this.productManagementRepository});

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

  String getFirstName (){
    return authService.userDataModel!.firstName ?? "";
  }

  void goToEditProduct() => Get.toNamed(Routes.EDIT_PRODUCT);

}
