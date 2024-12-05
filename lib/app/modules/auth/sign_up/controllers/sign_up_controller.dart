import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:sazim_app/app/core/services/auth_service.dart';
import 'package:sazim_app/app/core/widgets/loading.dart';
import 'package:sazim_app/app/data/dto_model/user_register_model.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';

import '../../../../routes/app_pages.dart';

class SignUpController extends GetxController {

  final AuthService authService;
  SignUpController({required this.authService});

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final addressController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

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
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    addressController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    phoneController.dispose();
    super.onClose();
  }

  void goToLogin(){
    Get.offAndToNamed(Routes.LOGIN);
  }

  Future<void> registerUserAndGoToHomeScreen({required BuildContext context})async{
    if(formKey.currentState!.validate())
      {
        Loader.show(context,progressIndicator: const Loading());
        UserRegisterModel userRegisterModel = UserRegisterModel(
          address: addressController.text,
          email: emailController.text,
          firebaseConsoleManagerToken: "Will implement",
          firstName: firstNameController.text,
          lastName: lastNameController.text,
          password: passwordController.text,
        );

        authService.registerUser(userRegisterModel: userRegisterModel).then((value) {
          Loader.hide();
          // Get.offAndToNamed(Routes.HOME);
        });

      }
  }

}
