import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sazim_app/app/core/theme/color_config.dart';
import 'package:sazim_app/app/core/theme/text_config.dart';
import 'package:sazim_app/app/core/widgets/input_widgets/image_picker_input_field.dart';

import '../../../core/widgets/buttons/routing_button.dart';
import '../../../core/widgets/routing_navigation_indicator.dart';
import '../../../core/widgets/title_content.dart';
import '../controllers/product_image_picker_controller.dart';

class ProductImagePickerView extends GetView<ProductImagePickerController> {
  const ProductImagePickerView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        key: UniqueKey(),
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TitleContent(title: "Select Image", content: "Let's create some listings"),
              const SizedBox(height: 45),
              ImagePickerInputField(
                imageBoxSize: Size(size.width, 300),
                imageSize: Size(size.width, 280),
                imagePath: controller.fileUploadController.imageFile.path,
                fileUploaderController: controller.fileUploadController,
              ),
              const SizedBox(height: 5),
              Obx(
                () {
                  return controller.showError.value ? Text("An image is required, Please select an Image", style: AppText().caption.copyWith(color: AppColor.semanticsError)) : const SizedBox();
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20),
        child: RoutingNavigationIndicator(
          leftOnClick: () => controller.goToPreviousPage(),
          leftRoutingType: PreviousRoutingStrategy(),
          rightRoutingType: NextRoutingStrategy(),
          rightOnClick: () => controller.saveDataAndGoToProductPricing(),
        ),
      ),
    );
  }
}
