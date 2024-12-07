import 'dart:developer';

import 'package:get/get.dart';
import 'package:sazim_app/app/core/services/auth_service.dart';
import 'package:sazim_app/app/data/repositories/category_repository_impl.dart';
import 'package:sazim_app/app/data/repositories/rent_repository_impl.dart';
import 'package:sazim_app/app/domain/entities/purchase_entity.dart';
import 'package:sazim_app/app/domain/entities/rent_entity.dart';
import 'package:sazim_app/app/domain/repositories/product_management_repository.dart';
import 'package:sazim_app/app/domain/repositories/purchase_repository.dart';

import '../../data/dto_model/purchase_request_model.dart';
import '../../data/dto_model/rent_request_model.dart';
import '../../data/models/category_model.dart';
import '../../data/models/purchase_data_model.dart';
import '../../data/models/rent_data_model.dart';
import '../../domain/entities/product_entity.dart';
import '../../domain/repositories/category_repository.dart';
import '../../domain/repositories/rent_repository.dart';

class ProductManagementService extends GetxService {
  final ProductManagementRepository productManagementRepository;
  final RentRepository rentRepository;
  final PurchaseRepository purchaseRepository;
  final CategoryRepository categoryRepository;
  final AuthService authService;

  ProductManagementService({required this.rentRepository,required this.purchaseRepository,required this.authService, required this.productManagementRepository, required this.categoryRepository});

  List<ProductEntity> allProducts = <ProductEntity>[].obs;
  List<ProductEntity> allProductsInShop = <ProductEntity>[].obs;
  List<ProductEntity> allProductsOfCurrentUser = <ProductEntity>[].obs;

  List<ProductEntity> myPurchase = <ProductEntity>[].obs;
  List<ProductEntity> mySales = <ProductEntity>[].obs;
  List<ProductEntity> myLend = <ProductEntity>[].obs;
  List<ProductEntity> myBorrow = <ProductEntity>[].obs;

  List<CategoryModel> listCategories = [];
  bool categoryLoaded = false;

  List<PurchasesEntity> allPurchases = <PurchasesEntity>[].obs;
  RxBool purchaseLoading = true.obs;

  List<RentEntity> allRents = <RentEntity>[].obs;
  RxBool rentLoading = true.obs;

  RxBool loading = true.obs;
  Map<String, String> categoryMap = {};

  Future<void> getAllCategories() async {
    try {
      if(listCategories.isEmpty)
        {
          await categoryRepository.getAllCategory().then(
                (value) {
              listCategories = value;
              for (var category in listCategories) {
                categoryMap.addAll({"${category.value}": "${category.label}"});
              }
              print(categoryMap);
              categoryLoaded = true;
            },
          );
        }
    } catch (error) {
      categoryLoaded = false;
      log("Error", error: error);
    }
  }

  Future<void> getAllUserProducts() async {
    loading.value = true;
    try {
      allProducts.clear();
      allProductsInShop.clear();
      allProductsOfCurrentUser.clear();
      myPurchase.clear();
      mySales.clear();
      myLend.clear();
      myBorrow.clear();

      await productManagementRepository.getAllProducts().then(
        (value) {
          loading.value = false;
          allProducts = value;

          /// we have all products now.. Lets sort them and fix them up

          for (var element in allProducts)
            {
              ProductEntity product = element;
              // Added the category label
              product.updateCategory(categoriesValues: getCategories(productEntity: element));

              if(product.seller == authService.userDataModel!.id)
                {
                  //Optimise reverse
                  allProductsOfCurrentUser.insert(0,product);
                }
              else
                {
                  allProductsInShop.insert(0,product);
                }
            }

          for(var product in allProductsOfCurrentUser)
            {
              if(allPurchases.any((element) => element.product! == product.id,))
                {
                  mySales.insert(0,product);
                }
              if(allRents.any((element) => element.product! == product.id,))
                {
                  myLend.insert(0,product);
                }
            }

          for(var product in allProductsInShop)
          {
            if(allPurchases.any((element) => element.product! == product.id && element.buyer! == authService.userDataModel!.id,))
            {
              myPurchase.insert(0,product);
            }
            if(allRents.any((element) => element.product! == product.id && element.renter! == authService.userDataModel!.id,))
            {
              myBorrow.insert(0,product);
            }
          }

          //Lets remove my sold products from my active view



        },
      );
    } catch (error) {
      log("Error", error: error);
    }
  }

  /// Get all label for a the selected categories
  List<String> getCategories({required ProductEntity productEntity}) {
    if (categoryLoaded) {
      List<String> selected = [];
      for (var category in productEntity.categories ?? []) {
        selected.add(categoryMap['$category'].toString());
      }
      return selected;
    } else {
      getAllCategories();
    }
    return [];
  }

  Future<void> updateProduct({required ProductEntity productEntity})async {
    await productManagementRepository.updateProduct(productEntity).then((value) {
      getAllUserProducts();
    },);
  }

  Future<void> deleteProduct({required String id})async{
   await productManagementRepository.deleteProduct(id);
   await getAllUserProducts();
  }


  Future<void> getAllPurchases() async {
    purchaseLoading.value = true;
    try {
      allPurchases.clear();
      await purchaseRepository.getAllPurchases().then(
            (value) {
          purchaseLoading.value = false;
          allPurchases = value;
        },
      );
    } catch (error) {
      log("Error fetching purchases", error: error);
      purchaseLoading.value = false;
    }
  }

  Future<void> sendPurchaseRequest({
    required int productId,
  }) async {
    try {
      PurchasesRequestModel request = PurchasesRequestModel(buyer: authService.userDataModel!.id,product: productId);
      await purchaseRepository.sendPurchaseRequest(purchasesRequestModel: request).then(
            (response) {
          log("Purchase request successful: $response");
          getAllPurchases();
        },
      );
    } catch (error) {
      log("Error sending purchase request", error: error);
    }
  }



  /// Rent Management
  Future<void> getAllRents() async {
    rentLoading.value = true;
    try {
      allRents.clear();
      await rentRepository.getAllRents().then(
            (value) {
          rentLoading.value = false;
          allRents = value;
        },
      );
    } catch (error) {
      log("Error fetching rents", error: error);
      rentLoading.value = false;
    }
  }

  Future<void> sendRentRequest({
    required int productId,
    required String rentType,
    required DateTime rentDurationStart,
    required DateTime rentDurationEnd,
  }) async {
    try {
      RentRequestModel request = RentRequestModel(
        product: productId,
        rentOption: rentType,
        renter: authService.userDataModel!.id,
        rentPeriodEndDate: rentDurationStart,
        rentPeriodStartDate: rentDurationEnd,
      );
      await rentRepository.sendRentRequest(rentRequestModel: request).then(
            (response) {
          log("Rent request successful: $response");
          getAllRents();
        },
      );
    } catch (error) {
      log("Error sending rent request", error: error);
    }
  }

}



