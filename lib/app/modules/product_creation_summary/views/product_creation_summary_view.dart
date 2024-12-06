import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sazim_app/app/core/theme/color_config.dart';
import 'package:sazim_app/app/core/theme/text_config.dart';
import 'package:sazim_app/app/modules/product_creation_summary/widgets/row_text_info.dart';
import 'package:sazim_app/app/modules/product_creation_summary/widgets/title_info.dart';

import '../../../core/widgets/buttons/routing_button.dart';
import '../../../core/widgets/routing_navigation_indicator.dart';
import '../../../core/widgets/title_content.dart';
import '../controllers/product_creation_summary_controller.dart';

class ProductCreationSummaryView extends GetView<ProductCreationSummaryController> {
  const ProductCreationSummaryView({super.key});

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
              const TitleContent(title: "View & Confirm", content: "Let's create some listings"),
              const SizedBox(height: 15),

              TitleInfo(title: "Title", information: controller.productCreationService.productTitle.value,),
              const SizedBox(height: 10,),

              TitleInfo(title: "Categories", information: controller.productCreationService.categories.map((element) => element.label,).toList().toString().replaceAll("[", "").replaceAll("]", ""),),
              const SizedBox(height: 10,),

              TitleInfo(title: "Description", information: controller.productCreationService.description.value,),
              const SizedBox(height: 10,),

              Material(
                borderRadius: BorderRadius.circular(10),
                color: AppColor.neutralFields,
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Pricing information",style: AppText().caption,),
                      const SizedBox(height: 10,),
                      RowTextInfo(title: "Selling Price", information: "\$${controller.productCreationService.sellingPrice.value}"),
                      RowTextInfo(title: "Rent Price", information: "\$${controller.productCreationService.rentPrice.value}"),
                      RowTextInfo(title: "Rent Type", information: controller.productCreationService.rentOption.value),
                    ],
                  ),
                ),
              )

            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20),
        child: RoutingNavigationIndicator(
          leftOnClick: () => controller.goToPreviousPage(),
          leftRoutingType: PreviousRoutingStrategy(),
          rightRoutingType: SubmitRoutingStrategy(),
          rightOnClick: () => controller.saveDataAndSubmitForProductCreation(context: context),
        ),
      ),
    );
  }
}
