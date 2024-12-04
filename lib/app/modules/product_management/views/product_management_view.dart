import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:r_icon_pro/r_icon_pro.dart';
import 'package:sazim_app/app/core/widgets/buttons/routing_button.dart';
import 'package:sazim_app/app/core/widgets/routing_navigation_indicator.dart';
import 'package:sazim_app/app/core/widgets/title_content.dart';

import '../../../core/utility/validator.dart';
import '../../../core/widgets/input_widgets/simple_input_field.dart';
import '../../../routes/app_pages.dart';
import '../controllers/product_management_controller.dart';

class ProductManagementView extends GetView<ProductManagementController> {
  const ProductManagementView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        key: UniqueKey(),
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TitleContent(title: "Add Product", content: "Let's create some listings"),
            const SizedBox(height: 45),
            Form(
              key: controller.formKey,
              child: SimpleInputField(
                controller: controller.titleController,
                inputType: TextInputType.emailAddress,
                hintText: "Enter Product Name",
                errorMessage: "Please enter a valid name",
                fieldTitle: "Product Name",
                needTitle: true,
                validatorClass: Validator().validateName,
                prefixIcon: RIcon.Box_Minimalistic,
              ),
            ),

            const Spacer(),
            RoutingNavigationIndicator(
              rightRoutingType: NextRoutingStrategy(),
              rightOnClick: ()=> controller.saveDataAndGoToCategorySelection(),
            ),
            const SizedBox(height: 45),

          ],
        ),
      ),
    );
  }
}

