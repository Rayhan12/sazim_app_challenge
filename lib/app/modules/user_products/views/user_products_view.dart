import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sazim_app/app/core/widgets/title_content.dart';

import '../../../core/theme/color_config.dart';
import '../../../core/theme/text_config.dart';
import '../controllers/user_products_controller.dart';


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
                    background: const TitleContent(title: "WELCOME @User Name", content: "How are you doing today!"),
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
              child: const Card(
                color: AppColor.primaryDefault,
                child: SizedBox(
                  height: 160,
                  width: double.infinity,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
