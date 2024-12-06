import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:multi_dropdown/multi_dropdown.dart';
import 'package:r_icon_pro/r_icon_pro.dart';
import 'package:sazim_app/app/core/widgets/input_widgets/multi_select_drop_down.dart';
import 'package:sazim_app/app/data/models/category_model.dart';
import '../../../core/widgets/buttons/routing_button.dart';
import '../../../core/widgets/product_creation_progress_indicator.dart';
import '../../../core/widgets/routing_navigation_indicator.dart';
import '../../../core/widgets/title_content.dart';
import '../controllers/product_category_select_controller.dart';

class ProductCategorySelectView
    extends GetView<ProductCategorySelectController> {
  const ProductCategorySelectView({super.key});
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
            const TitleContent(title: "Select Category", content: "Let's create some listings"),
            ProductCreationProgressIndicator(value: controller.productCreationService.getProgress()),
            Form(
              key: controller.formKey,
              child: MultiSelectDropDownInputField(
                controller: controller.categoryController,
                hintText: "Select Categories",
                errorMessage: "Select at lets one category",
                fieldTitle: "Select Categories",
                needTitle: true,
                itemBuilder: controller.getCategories().map((e) {
                  return DropdownItem<CategoryModel>(label: e.label.toString(), value: e);
                },).toList(),
                needValidation: true,
                prefixIcon: RIcon.Box_Minimalistic,
              ),
            ),


          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20),
        child: RoutingNavigationIndicator(
          leftOnClick: ()=> controller.goToPreviousPage(),
          leftRoutingType: PreviousRoutingStrategy(),

          rightRoutingType: NextRoutingStrategy(),
          rightOnClick: ()=> controller.saveDataAndGoToProductDescription(),
        ),
      ),
    );
  }
}
