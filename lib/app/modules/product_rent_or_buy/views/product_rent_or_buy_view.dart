import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sazim_app/app/modules/product_rent_or_buy/widgets/purchase_dialog_widget.dart';
import 'package:sazim_app/app/modules/product_rent_or_buy/widgets/rent_dialog_widget.dart';

import '../../../core/theme/color_config.dart';
import '../../../core/theme/text_config.dart';
import '../../../core/widgets/buttons/routing_button.dart';
import '../../../core/widgets/routing_navigation_indicator.dart';
import '../../../core/widgets/title_content.dart';
import '../../product_creation_summary/widgets/row_text_info.dart';
import '../../product_creation_summary/widgets/title_info.dart';
import '../controllers/product_rent_or_buy_controller.dart';

class ProductRentOrBuyView extends GetView<ProductRentOrBuyController> {
  const ProductRentOrBuyView({super.key});

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
              const TitleContent(title: "Buy/Rent", content: "Let's buy or rent this product"),
              const SizedBox(height: 15),
              TitleInfo(
                title: "Title",
                information: controller.productEntity.title.toString(),
              ),
              const SizedBox(
                height: 10,
              ),
              TitleInfo(
                title: "Categories",
                information: controller.productEntity.categoriesValues!
                    .map(
                      (element) => element,
                    )
                    .toList()
                    .toString()
                    .replaceAll("[", "")
                    .replaceAll("]", ""),
              ),
              const SizedBox(
                height: 10,
              ),
              TitleInfo(
                title: "Description",
                information: controller.productEntity.description.toString(),
              ),
              const SizedBox(
                height: 10,
              ),
              Material(
                borderRadius: BorderRadius.circular(10),
                color: AppColor.neutralFields,
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Pricing information",
                        style: AppText().caption,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      RowTextInfo(title: "Selling Price", information: "\$${controller.productEntity.purchasePrice.toString()}"),
                      RowTextInfo(title: "Rent Price", information: "\$${controller.productEntity.rentPrice.toString()}"),
                      RowTextInfo(title: "Rent Type", information: controller.productEntity.rentOption.toString()),
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
          leftOnClick: () {
            showPurchaseDialog(
              title: "Purchase",
              message: "Are you sure you would like to purchase this product?",
              onConfirm: () => controller.purchaseAndGoBack(context: context),
              onCancel: () => Get.back(),
            );
          },
          leftRoutingType: PurchaseRoutingStrategy(),
          rightRoutingType: RentRoutingStrategy(),
          rightOnClick: () {
            showRentDialog(
              title: "Rent",
              message: "Let's set for how long you would like to rent it",
              startDateController: controller.startDateController,
              endDateController: controller.endDateController,
              startTextController: controller.startTextController,
              endTextController: controller.endTextController,
              formKey: controller.formKey,
              onConfirm: ()=>controller.rentAndGoBack(context: context),
              onCancel: () => controller.rentDialogClose(),
            );
          },
        ),
      ),
    );
  }
}
