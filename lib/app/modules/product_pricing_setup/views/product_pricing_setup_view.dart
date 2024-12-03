import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/product_pricing_setup_controller.dart';

class ProductPricingSetupView extends GetView<ProductPricingSetupController> {
  const ProductPricingSetupView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ProductPricingSetupView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ProductPricingSetupView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
