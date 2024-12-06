import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sazim_app/app/core/widgets/cards/product_card.dart';
import 'package:sazim_app/app/core/widgets/title_content.dart';
import 'package:sazim_app/app/domain/entities/product_entity.dart';

import '../../../core/theme/color_config.dart';
import '../../../core/theme/text_config.dart';
import '../controllers/user_products_controller.dart';


///Temp Product Todo: Remove after impl
ProductEntity productEntity = ProductEntity(
  seller: 12,
  id: 1,
  title: "Cricket Equipment",
  rentOption: "day",
  categories: ["Electronics","Sports"],
  rentPrice: "12.99",
  purchasePrice: "299.99",
  datePosted: DateTime.now(),
  description: "A product description is a form of marketing copy used to describe and explain the benefits "
      "of your product. In other words, it provides all the information and details of your product on your "
      "ecommerce site. These product details can be one sentence, a short paragraph or bulleted. "
      "They can be serious, funny or quirky",
);

class UserProductsView extends GetView<UserProductsController> {
  const UserProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
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
                    )
                  );
                }),
            expandedHeight: 125,
            collapsedHeight: 29,
            toolbarHeight: 15,
            backgroundColor: Colors.transparent,

          ),
          SliverList.builder(
            itemCount: 12,
            // padding: const EdgeInsets.symmetric(vertical: 10),
            /// Todo: Implement widget based card here, Defile entity model first
            itemBuilder: (context, index) => InkWell(
              onTap: ()=>controller.goToEditProduct(),
              child: ProductCard(productEntity: productEntity),
              ),
            ),
        ],
      ),
    );
  }

}



