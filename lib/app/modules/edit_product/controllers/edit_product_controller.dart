import 'package:flutter/cupertino.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:get/get.dart';
import 'package:multi_dropdown/multi_dropdown.dart';
import 'package:sazim_app/app/core/services/product_creation_service.dart';
import 'package:sazim_app/app/core/widgets/loading.dart';
import 'package:sazim_app/app/data/models/category_model.dart';
import 'package:sazim_app/app/domain/entities/product_entity.dart';

import '../../../core/services/product_management_service.dart';

class EditProductController extends GetxController {

  late ProductEntity productEntity;
  final ProductManagementService productManagementService;
  EditProductController({required this.productManagementService});

  final formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  final descriptionController =  TextEditingController();
  final sellingPriceController = TextEditingController();
  final rentPriceController = TextEditingController();
  final rentTypeController = TextEditingController();
  final categoryController = MultiSelectController<CategoryModel>();

  List<CategoryModel> allCategories = [];
  List<CategoryModel> selectedItems = [];

  @override
  void onInit() {
    getCategories();
    productEntity = Get.arguments as ProductEntity;
    titleController.text = productEntity.title.toString();
    descriptionController.text = productEntity.description.toString();
    sellingPriceController.text = productEntity.purchasePrice.toString();
    rentPriceController.text = productEntity.rentPrice.toString();
    rentTypeController.text = productEntity.rentOption.toString();
    for(var selected in productEntity.categories ?? [])
    {
      CategoryModel model =  allCategories.firstWhere((element) => element.value.toString().contains(selected),);
      selectedItems.add(model);
    }
    categoryController.addItems(selectedItems.map((element) => DropdownItem<CategoryModel>(label: element.label.toString(), value: element,selected: true),).toList());
    print(categoryController.selectedItems);

    update();

    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    Loader.hide();
    super.onClose();
  }



  List<CategoryModel> getCategories(){
    if(productManagementService.categoryLoaded)
    {
      allCategories = productManagementService.listCategories;
      return allCategories;
    }
    return [];
  }

  Future<void> editProduct({required BuildContext context}) async{
    if(formKey.currentState!.validate())
      {
        Loader.show(context,progressIndicator: const Loading());
        ProductEntity productEntity = ProductEntity(
          categories: categoryController.selectedItems.map((e) => e.value.value.toString(),).toList(),
          description: descriptionController.text,
          purchasePrice: sellingPriceController.text,
          rentPrice: rentPriceController.text,
          rentOption: rentTypeController.text,
          title: titleController.text,
          id: this.productEntity.id,
          seller: this.productEntity.seller,
        );
        await productManagementService.updateProduct(productEntity: productEntity).then((value) {
          Loader.hide();
          Get.back();
        },);


      }
  }

}
