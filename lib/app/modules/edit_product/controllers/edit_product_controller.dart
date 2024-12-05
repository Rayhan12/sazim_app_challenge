import 'package:flutter/cupertino.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:get/get.dart';
import 'package:multi_dropdown/multi_dropdown.dart';
import 'package:sazim_app/app/core/widgets/loading.dart';
import 'package:sazim_app/app/data/repositories/ProductManagementRepositoryImpl.dart';
import 'package:sazim_app/app/domain/entities/product_entity.dart';

class EditProductController extends GetxController {

  final ProductManagementRepositoryImpl productManagementRepositoryImpl;
  EditProductController({required this.productManagementRepositoryImpl});

  final formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  final descriptionController =  TextEditingController();
  final sellingPriceController = TextEditingController();
  final rentPriceController = TextEditingController();
  final rentTypeController = TextEditingController();
  final categoryController = MultiSelectController<String>();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> editProduct({required BuildContext context}) async{
    if(formKey.currentState!.validate())
      {
        Loader.show(context,progressIndicator: const Loading());
        ProductEntity productEntity = ProductEntity(
          categories: categoryController.selectedItems.map((e) => e.value,).toList(),
          description: descriptionController.text,
          purchasePrice: sellingPriceController.text,
          rentPrice: rentPriceController.text,
          rentOption: rentTypeController.text,
          title: titleController.text,
          ///Setup ID & SELLER
          id: 0,
          seller: 0,
        );
        await productManagementRepositoryImpl.updateProduct(productEntity);

        Loader.hide();
      }
  }

}
