import 'package:get/get.dart';


class ProductCreationService extends GetxService{
  RxString productTitle = "".obs;
  RxList  categories = [].obs;
  RxString filePath = "".obs;
  RxString description = "".obs;
  RxDouble sellingPrice = 0.0.obs;
  RxDouble rentPrice = 0.0.obs;
  RxString rentOption = "".obs;

  int totalSteps = 5;
  RxInt currentStep = 1.obs;


  void updateProductTitle({required String productTitle})
  {
    this.productTitle.value = productTitle;
  }

  void updateProductCategory({required List<String> categories})
  {
    this.categories.value = categories;
  }

  void updateProductDescription({required String description})
  {
    this.description.value = description;
  }

  void updateProductImage({required String filePath})
  {
    this.filePath.value = filePath;
  }

  void updateProductPricing({required double sellingPrice, required double rentPrice, required String rentOption,})
  {
    this.sellingPrice.value = sellingPrice;
    this.rentPrice.value = rentPrice;
    this.rentOption.value = rentOption;
  }


  void resetService(){
    productTitle = "".obs;
    categories = [].obs;
    filePath = "".obs;
    description = "".obs;
    sellingPrice = 0.0.obs;
    rentPrice = 0.0.obs;
    rentOption = "".obs;
    currentStep = 1.obs;
  }
  void setProgress({required int index}) {
    currentStep.value = index;
  }
  double getProgress() {
    return currentStep.value/totalSteps;
  }




  @override
  String toString() {
    return 'ProductCreationService{productName: $productTitle, categories: $categories, filePath: $filePath, description: $description, sellingPrice: $sellingPrice, rentPrice: $rentPrice, rentOption: $rentOption}';
  }
}