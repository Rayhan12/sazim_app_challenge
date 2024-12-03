import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/product_category_select_controller.dart';

class ProductCategorySelectView
    extends GetView<ProductCategorySelectController> {
  const ProductCategorySelectView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ProductCategorySelectView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ProductCategorySelectView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
