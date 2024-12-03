import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/product_description_enter_controller.dart';

class ProductDescriptionEnterView
    extends GetView<ProductDescriptionEnterController> {
  const ProductDescriptionEnterView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ProductDescriptionEnterView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ProductDescriptionEnterView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
