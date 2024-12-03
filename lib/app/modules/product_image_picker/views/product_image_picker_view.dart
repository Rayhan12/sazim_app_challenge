import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/product_image_picker_controller.dart';

class ProductImagePickerView extends GetView<ProductImagePickerController> {
  const ProductImagePickerView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ProductImagePickerView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ProductImagePickerView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
