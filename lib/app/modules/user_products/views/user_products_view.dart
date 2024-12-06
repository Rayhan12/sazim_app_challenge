import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sazim_app/app/core/constant/constant_config.dart';
import 'package:sazim_app/app/core/widgets/cards/product_card.dart';
import 'package:sazim_app/app/core/widgets/message_box.dart';
import 'package:sazim_app/app/core/widgets/title_content.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../core/theme/text_config.dart';
import '../controllers/user_products_controller.dart';

class UserProductsView extends GetView<UserProductsController> {
  const UserProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: RefreshIndicator(
        onRefresh: ()=>controller.productManagementService.getAllUserProducts(),
        child: CustomScrollView(
          controller: controller.scrollController,
          slivers: [
            SliverAppBar(
              automaticallyImplyLeading: false,
              pinned: true,
              flexibleSpace: LayoutBuilder(
                  key: controller.sliverAppBar,
                  builder: (context, constraints) {
                    return FlexibleSpaceBar(
                        expandedTitleScale: 1.3,
                        background: TitleContent(title: "Welcome, ${controller.getFirstName()}", content: "How are you doing today!"),
                        centerTitle: false,
                        collapseMode: CollapseMode.parallax,
                        titlePadding: EdgeInsets.zero,
                        title: Material(
                          child: Row(
                            children: [
                              Text(
                                "My Products",
                                style: AppText().title3,
                              ),
                            ],
                          ),
                        ));
                  }),
              expandedHeight: 125,
              collapsedHeight: 29,
              toolbarHeight: 15,
              backgroundColor: Colors.transparent,
            ),
            Obx(() {
              return !controller.productManagementService.loading.value
                  ? SliverList.builder(
                      itemCount: controller.productManagementService.loading.value
                          ? 3
                          : controller.productManagementService.allProductsOfCurrentUser.isEmpty
                              ? 1
                              : controller.productManagementService.allProductsOfCurrentUser.length,
                      itemBuilder: (context, index) {
                        if (controller.productManagementService.allProductsOfCurrentUser.isEmpty) {
                          return const MessageBox(
                            message: "You don't have any product available \n Why not add some right away!",
                          );
                        } else {
                          return InkWell(
                            onTap: () => controller.goToEditProduct(productEntity: controller.productManagementService.allProductsOfCurrentUser[index]),
                            child: ProductCard(
                              productEntity: controller.productManagementService.allProductsOfCurrentUser[index],
                              onDelete: () => controller.deleteProduct(id: controller.productManagementService.allProductsOfCurrentUser[index].id.toString(),context: context),
                            ),
                          );
                        }
                      },
                    )
                  : SliverList.builder(
                      itemCount: 3,
                      itemBuilder: (context, index) => Skeletonizer(
                          child: ProductCard(
                        productEntity: blankEntity,
                        onDelete: () {},
                      )),
                    );
            }),
          ],
        ),
      ),
    );
  }
}
