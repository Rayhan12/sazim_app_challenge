import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:get/get.dart';
import 'package:sazim_app/app/data/dto_model/user_login_model.dart';

import '../../../../core/services/auth_service.dart';
import '../../../../core/widgets/loading.dart';
import '../../../../routes/app_pages.dart';

class LoginController extends GetxController {
  final AuthService authService;
  LoginController({required this.authService});

  final emailController =  TextEditingController();
  final passwordController =  TextEditingController();

  final formKey = GlobalKey<FormState>();

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

  Future<void> logInUserAndNavigateToHome({required BuildContext context})async{
    if(formKey.currentState!.validate())
      {
        Loader.show(context,progressIndicator: const Loading());
        UserLoginModel userLoginModel = UserLoginModel(email: emailController.text.trim().toLowerCase(),password: passwordController.text.trim());

        try {
          await authService.loginUser(userLoginModel: userLoginModel).then((value) {
            Loader.hide();
            if(value) Get.offAndToNamed(Routes.HOME);
          },);
        } catch (error) {
          Loader.hide();
          // Get.snackbar("Login Failed", error.toString(), snackPosition: SnackPosition.BOTTOM);
        }
      }
  }


  Future<void> biometricLogInUserAndNavigateToHome({required BuildContext context}) async {
    Loader.show(context, progressIndicator: const Loading());

    try {
      // Check if biometric login is enabled
      if (authService.getBiometricEnabledStatus()) {
        final isLoginSuccessful = await authService.biometricLogin();
        print("############################");
        print(isLoginSuccessful);

        Loader.hide();

        if (isLoginSuccessful) {
          // Navigate to home if login succeeds
          Get.offAndToNamed(Routes.HOME);
        } else {
          // Show failure message
          Get.snackbar("Login Failed", "Please try again");
        }
      } else {
        // Handle when biometric login is not enabled
        Loader.hide();
        Get.closeAllSnackbars();
        Get.snackbar("Biometric Login unavailable", "Login/Register to enable it");
      }
    } catch (error) {
      // Handle any errors
      Loader.hide();
      Get.snackbar("Error", "An unexpected error occurred. Please try again.");
      log("Biometric Login Error", error: error);
    }
  }






}
