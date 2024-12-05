import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:r_icon_pro/r_icon_pro.dart';
import 'package:sazim_app/app/core/widgets/buttons/rounded_action_buttons.dart';

import '../../../core/theme/color_config.dart';
import '../../../core/theme/text_config.dart';
import '../../../core/utility/validator.dart';
import '../../../core/widgets/input_widgets/drop-down_input_field.dart';
import '../../../core/widgets/input_widgets/multi_line_input_field.dart';
import '../../../core/widgets/input_widgets/multi_select_drop_down.dart';
import '../../../core/widgets/input_widgets/simple_input_field.dart';
import '../../../core/widgets/product_creation_progress_indicator.dart';
import '../../../core/widgets/routing_navigation_indicator.dart';
import '../../../core/widgets/title_content.dart';
import '../controllers/edit_product_controller.dart';

class EditProductView extends GetView<EditProductController> {
  const EditProductView({super.key});

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
                const TitleContent(title: "Edit Product", content: "Let's update the product details"),
                const SizedBox(
                  height: 25,
                ),
                SimpleInputField(
                  controller: controller.titleController,
                  inputType: TextInputType.emailAddress,
                  hintText: "Enter Product Name",
                  errorMessage: "Please enter a valid name",
                  fieldTitle: "Product Name",
                  needTitle: true,
                  validatorClass: Validator().validateName,
                  prefixIcon: RIcon.Box_Minimalistic,
                ),
                const SizedBox(
                  height: 10,
                ),
                MultiSelectDropDownInputField(
                  controller: controller.categoryController,
                  hintText: "Select Categories",
                  errorMessage: "Select at lets one category",
                  fieldTitle: "Select Categories",
                  needTitle: true,
                  items: ["Test 1", "Test 2", "Test 3", "Test 4"],
                  needValidation: true,
                  prefixIcon: RIcon.Box_Minimalistic,
                ),
                const SizedBox(
                  height: 10,
                ),
                MultiLineInputField(
                  controller: controller.descriptionController,
                  hintText: "Product Description",
                  fieldTitle: "Product Description",
                  needTitle: true,
                  numberOfLines: 7,
                  validatorClass: Validator().validateDescription,
                ),
                const SizedBox(
                  height: 10,
                ),
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
                const SizedBox(
                  height: 25,
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: AppColor.neutralsBg,
          boxShadow: [
            BoxShadow(
              color: AppColor.textDisabled.withOpacity(0.4),
              blurRadius: 7,
              offset: const Offset(0, -4)
            )
          ]
        ),
        child: RoundedActionButton(
          onClick: ()=>controller.editProduct(context: context),
          title: "Update Product",
        ),
      ),
    );
  }
}
