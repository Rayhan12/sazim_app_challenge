import 'package:get/get.dart';
import 'package:sazim_app/app/core/services/auth_service.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(authService: Get.find<AuthService>()),
    );
  }
}
