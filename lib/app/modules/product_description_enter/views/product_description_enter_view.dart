import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sazim_app/app/core/utility/validator.dart';
import 'package:sazim_app/app/core/widgets/input_widgets/multi_line_input_field.dart';

import '../../../core/widgets/buttons/routing_button.dart';
import '../../../core/widgets/routing_navigation_indicator.dart';
import '../../../core/widgets/title_content.dart';
import '../controllers/product_description_enter_controller.dart';

class ProductDescriptionEnterView
    extends GetView<ProductDescriptionEnterController> {
  const ProductDescriptionEnterView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        key: UniqueKey(),
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TitleContent(title: "Enter Description", content: "Let's create some listings"),

              const SizedBox(height: 45),
              Form(
                key: controller.formKey,
                child: MultiLineInputField(
                  controller: controller.descriptionController,
                  hintText: "Product Description",
                  fieldTitle: "Product Description",
                  needTitle: true,
                  numberOfLines: 7,
                  validatorClass: Validator().validateDescription,
                ),
              ),


            ],
          ),
        ),
      ),

      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20),
        child: RoutingNavigationIndicator(
          leftOnClick: ()=> controller.goToPreviousPage(),
          leftRoutingType: PreviousRoutingStrategy(),

          rightRoutingType: NextRoutingStrategy(),
          rightOnClick: ()=> controller.saveDataAndGoToProductImagePicker(),
        ),
      ),
    );
  }
}
