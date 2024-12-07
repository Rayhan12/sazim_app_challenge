import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sazim_app/app/core/services/auth_service.dart';
import 'package:sazim_app/app/core/services/product_creation_service.dart';
import 'package:sazim_app/app/data/repositories/product_management_repository_impl.dart';
import 'package:sazim_app/app/data/repositories/category_repository_impl.dart';
import 'package:sazim_app/app/data/repositories/purchase_repository_impl.dart';
import 'package:sazim_app/app/data/repositories/rent_repository_impl.dart';
import 'package:sazim_app/app/data/repositories/user_auth_repository_impl.dart';
import 'package:sazim_app/app/modules/history/controllers/history_controller.dart';
import 'package:sazim_app/app/modules/home/controllers/home_controller.dart';
import 'package:sazim_app/app/modules/shop/controllers/shop_controller.dart';
import 'package:sazim_app/app/modules/user_products/controllers/user_products_controller.dart';

import '../../data/data_source/local_data_source/storage_service/storage_service_impl.dart';
import '../services/product_management_service.dart';

class DependencyInjection{
  static void init(){

   ///Register Repository
    Get.put(UserAuthRepositoryImpl());
    Get.put(ProductManagementRepositoryImpl());
    Get.put(CategoryRepositoryImpl());
    Get.put(RentRepositoryImpl());
    Get.put(PurchaseRepositoryImpl());
    Get.put<StorageServiceImpl>(StorageServiceImpl(),permanent: true);

    /// Register Services
    Get.put<AuthService>(AuthService(userAuthRepository: Get.find<UserAuthRepositoryImpl>(), storageService: Get.find<StorageServiceImpl>()),permanent: true);
    Get.put<ProductCreationService>(ProductCreationService(authService: Get.find<AuthService>(),categoryRepository: Get.find<CategoryRepositoryImpl>(), productManagementRepository: Get.find<ProductManagementRepositoryImpl>()),permanent: true);
    Get.put<ProductManagementService>(ProductManagementService(authService: Get.find<AuthService>() , productManagementRepository: Get.find<ProductManagementRepositoryImpl>(), categoryRepository: Get.find<CategoryRepositoryImpl>(), purchaseRepository: Get.find<PurchaseRepositoryImpl>() , rentRepository: Get.find<RentRepositoryImpl>()));

    /// Register Controllers
    // Get.put<HomeController>(HomeController(authService: Get.find<AuthService>()),permanent: true);
    // Get.put<UserProductsController>(UserProductsController(authService: Get.find<AuthService>() ,productManagementService: Get.find<ProductManagementService>()),permanent: true);
    // Get.put<ShopController>(ShopController(authService: Get.find<AuthService>() ,productManagementService: Get.find<ProductManagementService>()),permanent: true);
    Get.lazyPut<HomeController>(() => HomeController(authService: Get.find<AuthService>()),fenix: true);
    Get.lazyPut<UserProductsController>(() => UserProductsController(authService: Get.find<AuthService>() ,productManagementService: Get.find<ProductManagementService>()),fenix: true);
    Get.lazyPut<ShopController>(() => ShopController(authService: Get.find<AuthService>() ,productManagementService: Get.find<ProductManagementService>()),fenix: true);
    Get.lazyPut<HistoryController>(() => HistoryController(productManagementService: Get.find<ProductManagementService>()),fenix: true);

  }
}