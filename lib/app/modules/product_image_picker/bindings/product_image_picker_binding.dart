import 'package:get/get.dart';

import '../controllers/product_image_picker_controller.dart';

class ProductImagePickerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductImagePickerController>(
      () => ProductImagePickerController(productCreationService: Get.find()),
    );
  }
}
