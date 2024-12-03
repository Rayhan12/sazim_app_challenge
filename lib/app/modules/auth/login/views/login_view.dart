import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sazim_app/app/core/utility/validator.dart';
import 'package:sazim_app/app/core/widgets/input_widgets/password_input_field_single.dart';
import 'package:sazim_app/app/core/widgets/input_widgets/simple_input_field.dart';

import '../../../../core/theme/color_config.dart';
import '../../../../core/theme/text_config.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "LOGIN",
                style: AppText().title1.copyWith(
                    color: AppColor.primaryDefault,
                    fontWeight: FontWeight.w800),
              ),
              Text(
                "Login with your email and password",
                style: AppText().body,
              ),
              const SizedBox(height: 35),
              SimpleInputField(
                controller: controller.emailController,
                hintText: "Enter your email",
                errorMessage: "Please enter a valid email",
                fieldTitle: "Email",
                needTitle: true,
                validatorClass: Validator().validateEmail,
              ),
              const SizedBox(height: 15),
              PasswordInputFieldSingle(
                password: controller.passwordController,
                hintText: "Enter your password",
                fieldTitle: "Password",
              )
            ],
          ),
        ));
  }
}
