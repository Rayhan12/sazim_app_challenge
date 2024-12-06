import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:r_icon_pro/r_icon_pro.dart';
import 'package:sazim_app/app/core/utility/validator.dart';
import 'package:sazim_app/app/core/widgets/buttons/rounded_action_buttons.dart';
import 'package:sazim_app/app/core/widgets/input_widgets/password_input_field_single.dart';
import 'package:sazim_app/app/core/widgets/input_widgets/simple_input_field.dart';
import 'package:sazim_app/app/core/widgets/message_with_action.dart';
import 'package:sazim_app/app/core/widgets/title_content.dart';
import 'package:sazim_app/app/modules/auth/login/widgets/biometric_login_button.dart';

import '../../../../core/theme/color_config.dart';
import '../../../../core/theme/text_config.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        // appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: SingleChildScrollView(
            child: SizedBox(
              height: size.height,
              child: Form(
                key: controller.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const TitleContent(title: "LOGIN", content: "Login with your email and password"),
                    const SizedBox(height: 45),
                    SimpleInputField(
                      controller: controller.emailController,
                      inputType: TextInputType.emailAddress,
                      hintText: "Enter your email",
                      errorMessage: "Please enter a valid email",
                      fieldTitle: "Email",
                      needTitle: true,
                      validatorClass: Validator().validateEmail,
                      prefixIcon: RIcon.Letter,
                    ),
                    const SizedBox(height: 15),
                    PasswordInputFieldSingle(
                      password: controller.passwordController,
                      prefixIcon: RIcon.Lock,
                      hintText: "Enter your password",
                      fieldTitle: "Password",
                    ),
                    const SizedBox(height: 15),
                    RoundedActionButton(
                      onClick: (){
                        controller.logInUserAndNavigateToHome(context: context);
                      },
                      title: "Login",
                    ),
                    const SizedBox(height: 15),
                    MessageWithAction(
                      message: "Don't have an account?",
                      buttonText: "Sign Up",
                      onClick: () => controller.goToSignUp(),
                    ),

                    const SizedBox(height: 20,),

                    BiometricLoginButton(onClick: (){})
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
