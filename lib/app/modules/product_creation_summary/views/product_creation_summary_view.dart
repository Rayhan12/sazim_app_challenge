import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/product_creation_summary_controller.dart';

class ProductCreationSummaryView
    extends GetView<ProductCreationSummaryController> {
  const ProductCreationSummaryView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ProductCreationSummaryView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ProductCreationSummaryView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
