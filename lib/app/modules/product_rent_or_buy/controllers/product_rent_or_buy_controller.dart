import 'package:flutter/cupertino.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:get/get.dart';
import 'package:sazim_app/app/core/custom_controllers/date_time_controller.dart';
import 'package:sazim_app/app/core/services/product_management_service.dart';
import 'package:sazim_app/app/core/widgets/loading.dart';

import '../../../domain/entities/product_entity.dart';

class ProductRentOrBuyController extends GetxController {
  late ProductEntity productEntity;
  final ProductManagementService productManagementService;

  ProductRentOrBuyController({required this.productManagementService});

  final DateTimeController startDateController = DateTimeController();
  final DateTimeController endDateController = DateTimeController();
  final TextEditingController startTextController = TextEditingController();
  final TextEditingController endTextController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  RxBool showDateSelectionError = false.obs;

  @override
  void onInit() {
    productEntity = Get.arguments as ProductEntity;
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    Loader.hide();
    super.onClose();
  }

  Future<void> purchaseAndGoBack({required BuildContext context}) async {
    Loader.show(context, progressIndicator: const Loading());
    await productManagementService.sendPurchaseRequest(productId: productEntity.id!);
    await productManagementService.getAllPurchases();
    await productManagementService.getAllUserProducts();
    Loader.hide();
    Get.back();
    Get.back();
  }

  Future<void> rentAndGoBack({required BuildContext context}) async {
    if(formKey.currentState!.validate())
      {
        if(startDateController.hasDate() && endDateController.hasDate() && startDateController.dateTime!.isBefore(endDateController.dateTime!)){
          showDateSelectionError.value = false;
          Loader.show(context, progressIndicator: const Loading());
          await productManagementService.sendRentRequest(
            productId: productEntity.id!,
            rentType: productEntity.rentOption.toString(),
            rentDurationEnd: endDateController.dateTime!,
            rentDurationStart: startDateController.dateTime!,
          );
          await productManagementService.getAllRents();
          await productManagementService.getAllUserProducts();
          Loader.hide();
          Get.back();
          Get.back();
        }
        else
          {
            showDateSelectionError.value = true;
          }
      }
  }

  void rentDialogClose(){
    showDateSelectionError.value = false;
    Get.back();
  }
}
