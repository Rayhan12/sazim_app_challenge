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

  void logInUserAndNavigateToHome({required BuildContext context})async{
    if(formKey.currentState!.validate())
      {
        Loader.show(context,progressIndicator: const Loading());
        UserLoginModel userLoginModel = UserLoginModel(email: emailController.text.trim().toLowerCase(),password: passwordController.text.trim());

        await authService.loginUser(userLoginModel: userLoginModel).then((value) {
          Loader.hide();
          Get.offAndToNamed(Routes.HOME);
        },);
      }

    ///Todo: Implement login logic
  }


}
