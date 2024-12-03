import 'package:flutter/material.dart';

import 'package:get/get.dart';

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
            tabs: [
              Tab(child: Text("Bought"),),
              Tab(child: Text("Sold"),),
              Tab(child: Text("Borrowed"),),
              Tab(child: Text("Lent"),),
            ],
          ),

          Expanded(
            child: TabBarView(
              children: [
                Text("data1"),
                Text("data2"),
                Text("data3"),
                Text("data4"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
