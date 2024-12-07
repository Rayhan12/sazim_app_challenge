import 'package:get/get.dart';

import '../modules/auth/login/bindings/login_binding.dart';
import '../modules/auth/login/views/login_view.dart';
import '../modules/auth/sign_up/bindings/sign_up_binding.dart';
import '../modules/auth/sign_up/views/sign_up_view.dart';
import '../modules/edit_product/bindings/edit_product_binding.dart';
import '../modules/edit_product/views/edit_product_view.dart';
import '../modules/history/bindings/history_binding.dart';
import '../modules/history/views/history_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/product_category_select/bindings/product_category_select_binding.dart';
import '../modules/product_category_select/views/product_category_select_view.dart';
import '../modules/product_creation_summary/bindings/product_creation_summary_binding.dart';
import '../modules/product_creation_summary/views/product_creation_summary_view.dart';
import '../modules/product_description_enter/bindings/product_description_enter_binding.dart';
import '../modules/product_description_enter/views/product_description_enter_view.dart';
import '../modules/product_image_picker/bindings/product_image_picker_binding.dart';
import '../modules/product_image_picker/views/product_image_picker_view.dart';
import '../modules/product_management/bindings/product_management_binding.dart';
import '../modules/product_management/views/product_management_view.dart';
import '../modules/product_pricing_setup/bindings/product_pricing_setup_binding.dart';
import '../modules/product_pricing_setup/views/product_pricing_setup_view.dart';
import '../modules/product_rent_or_buy/bindings/product_rent_or_buy_binding.dart';
import '../modules/product_rent_or_buy/views/product_rent_or_buy_view.dart';
import '../modules/shop/bindings/shop_binding.dart';
import '../modules/shop/views/shop_view.dart';
import '../modules/user_products/bindings/user_products_binding.dart';
import '../modules/user_products/views/user_products_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.LOGIN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.SIGN_UP,
      page: () => const SignUpView(),
      binding: SignUpBinding(),
    ),
    GetPage(
      name: _Paths.USER_PRODUCTS,
      page: () => const UserProductsView(),
      binding: UserProductsBinding(),
    ),
    GetPage(
      name: _Paths.SHOP,
      page: () => const ShopView(),
      binding: ShopBinding(),
    ),
    GetPage(
      name: _Paths.PRODUCT_MANAGEMENT,
      page: () => const ProductManagementView(),
      binding: ProductManagementBinding(),
    ),
    GetPage(
      name: _Paths.HISTORY,
      page: () => const HistoryView(),
      binding: HistoryBinding(),
    ),
    GetPage(
      name: _Paths.PRODUCT_CATEGORY_SELECT,
      page: () => const ProductCategorySelectView(),
      binding: ProductCategorySelectBinding(),
    ),
    GetPage(
      name: _Paths.PRODUCT_DESCRIPTION_ENTER,
      page: () => const ProductDescriptionEnterView(),
      binding: ProductDescriptionEnterBinding(),
    ),
    GetPage(
      name: _Paths.PRODUCT_IMAGE_PICKER,
      page: () => const ProductImagePickerView(),
      binding: ProductImagePickerBinding(),
    ),
    GetPage(
      name: _Paths.PRODUCT_PRICING_SETUP,
      page: () => const ProductPricingSetupView(),
      binding: ProductPricingSetupBinding(),
    ),
    GetPage(
      name: _Paths.PRODUCT_CREATION_SUMMARY,
      page: () => const ProductCreationSummaryView(),
      binding: ProductCreationSummaryBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_PRODUCT,
      page: () => const EditProductView(),
      binding: EditProductBinding(),
    ),
    GetPage(
      name: _Paths.PRODUCT_RENT_OR_BUY,
      page: () => const ProductRentOrBuyView(),
      binding: ProductRentOrBuyBinding(),
    ),
  ];
}
