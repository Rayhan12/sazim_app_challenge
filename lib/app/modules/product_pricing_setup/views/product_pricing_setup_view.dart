import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:r_icon_pro/r_icon_pro.dart';
import 'package:sazim_app/app/core/theme/color_config.dart';
import 'package:sazim_app/app/core/theme/text_config.dart';
import 'package:sazim_app/app/core/widgets/input_widgets/drop-down_input_field.dart';

import '../../../core/utility/validator.dart';
import '../../../core/widgets/buttons/routing_button.dart';
import '../../../core/widgets/input_widgets/simple_input_field.dart';
import '../../../core/widgets/product_creation_progress_indicator.dart';
import '../../../core/widgets/routing_navigation_indicator.dart';
import '../../../core/widgets/title_content.dart';
import '../controllers/product_pricing_setup_controller.dart';

class ProductPricingSetupView extends GetView<ProductPricingSetupController> {
  const ProductPricingSetupView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        key: UniqueKey(),
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: SingleChildScrollView(
          child: Form(
            key: controller.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TitleContent(title: "Product Pricing", content: "Let's create some listings"),
                ProductCreationProgressIndicator(value: controller.productCreationService.getProgress()),
                Text(
                  "Selling Setup",
                  style: AppText().title3.copyWith(color: AppColor.textSecondary),
                ),
                const SizedBox(
                  height: 15,
                ),
                SimpleInputField(
                  controller: controller.sellingPriceController,
                  inputType: TextInputType.number,
                  hintText: "Enter Selling Price",
                  errorMessage: "Please enter a valid selling price",
                  fieldTitle: "Product Selling Price",
                  needTitle: true,
                  validatorClass: Validator().validatePrice,
                  prefixIcon: RIcon.Tag_Price,
                ),
                const SizedBox(
                  height: 25,
                ),
                Text(
                  "Rental Setup",
                  style: AppText().title3.copyWith(color: AppColor.textSecondary),
                ),
                const SizedBox(
                  height: 15,
                ),
                SimpleInputField(
                  controller: controller.rentPriceController,
                  inputType: TextInputType.number,
                  hintText: "Enter Product Rent",
                  errorMessage: "Please enter a valid rent",
                  fieldTitle: "Product Rent",
                  needTitle: true,
                  validatorClass: Validator().validatePrice,
                  prefixIcon: RIcon.Wallet_Money,
                ),
                const SizedBox(
                  height: 10,
                ),
                DropDownInputField(
                  controller: controller.rentTypeController,
                  hintText: "Select Rent Type",
                  needValidation: true,
                  errorMessage: "Please select a rent type",
                  fieldTitle: "Rent Type",
                  prefixIcon: RIcon.Clock_Square,
                  items: ["Hourly", "Day", "Monthly"],
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20),
        child: RoutingNavigationIndicator(
          leftOnClick: () => controller.goToPreviousPage(),
          leftRoutingType: PreviousRoutingStrategy(),
          rightRoutingType: NextRoutingStrategy(),
          rightOnClick: () => controller.saveDataAndGoToProductSummary(),
        ),
      ),
    );
  }
}
