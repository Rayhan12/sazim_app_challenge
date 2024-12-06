import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../core/constant/constant_config.dart';
import '../../../core/widgets/cards/product_card.dart';
import '../../../core/widgets/message_box.dart';
import '../../../core/widgets/title_content.dart';
import '../controllers/shop_controller.dart';

class ShopView extends GetView<ShopController> {
  const ShopView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TitleContent(title: "Shop", content: "Let's Check out some listings"),
            const SizedBox(height: 20,),
            Obx(() {
              return !controller.productManagementService.loading.value
                  ? Expanded(
                      child: RefreshIndicator(
                        onRefresh: ()=>controller.productManagementService.getAllUserProducts(),
                        child: ListView.builder(
                          itemCount: controller.productManagementService.loading.value
                              ? 3
                              : controller.productManagementService.allProductsInShop.isEmpty
                                  ? 1
                                  : controller.productManagementService.allProductsInShop.length,
                          itemBuilder: (context, index) {
                            if (controller.productManagementService.allProductsInShop.isEmpty) {
                              return const MessageBox(
                                message: "Hmm!!, The shop looks empty.\nTune back later",
                              );
                            } else {
                              return InkWell(
                                onTap: () => controller.goToRentOrBuyProduct(productEntity: controller.productManagementService.allProductsInShop[index]),
                                child: ProductCard(productEntity: controller.productManagementService.allProductsInShop[index]),
                              );
                            }
                          },
                        ),
                      ),
                    )
                  : ListView.builder(
                      itemCount: 3,
                      shrinkWrap: true,
                      itemBuilder: (context, index) => Skeletonizer(child: ProductCard(productEntity: blankEntity)),
                    );
            })
          ],
        ),
      ),
    );
  }
}
