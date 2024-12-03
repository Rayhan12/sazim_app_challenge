import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../routes/app_pages.dart';

class LoginController extends GetxController {
  //TODO: Implement LoginController

  final emailController =  TextEditingController();
  final passwordController =  TextEditingController();

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
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  void goToSignUp(){
    Get.offAndToNamed(Routes.SIGN_UP);
  }

  void logInUser(){
    Get.offAndToNamed(Routes.HOME);
    ///Todo: Implement login logic
  }


}
