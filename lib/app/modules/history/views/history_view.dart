import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sazim_app/app/domain/entities/product_entity.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../core/constant/constant_config.dart';
import '../../../core/widgets/cards/product_card.dart';
import '../../../core/widgets/message_box.dart';
import '../controllers/history_controller.dart';

class HistoryView extends GetView<HistoryController> {
  const HistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      initialIndex: 0,
      animationDuration: Duration(milliseconds: 300),
      child: Column(
        children: [
          TabBar(
            tabs: const [
              Tab(child: Text("Bought"),),
              Tab(child: Text("Sold"),),
              Tab(child: Text("Borrowed"),),
              Tab(child: Text("Lent"),),
            ],
          ),

          Expanded(
            child: TabBarView(
              children: [
                generateObsListView(index: 1),
                generateObsListView(index: 2),
                generateObsListView(index: 3),
                generateObsListView(index: 4),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget generateObsListView({required int index}){
  final controller = Get.find<HistoryController>();
  return Obx(() {
    var cn = controller.productManagementService;
    var observeTarget = index == 1 ? cn.myPurchase : index == 2 ? cn.mySales : index == 3 ? cn.myBorrow : cn.myLend;
    return !cn.loading.value
        ? Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: ListView.builder(
            itemCount: cn.loading.value
                ? 3
                : observeTarget.isEmpty
                ? 1
                : observeTarget.length,
            itemBuilder: (context, index) {
              if (observeTarget.isEmpty) {
                return const MessageBox(
                  message: "Hmm..No data to\nshow here right now!",
                );
              } else {
                return InkWell(
                  onTap: (){},
                  child: ProductCard(productEntity: observeTarget[index]),
                );
              }
            },
          ),
        )
        : ListView.builder(
      itemCount: 3,
      shrinkWrap: true,
      itemBuilder: (context, index) => Skeletonizer(child: ProductCard(productEntity: blankEntity)),
    );
  });
}
