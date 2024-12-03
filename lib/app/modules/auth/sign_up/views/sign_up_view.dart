import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:r_icon_pro/r_icon_pro.dart';
import 'package:sazim_app/app/core/widgets/title_content.dart';

import '../../../../core/theme/color_config.dart';
import '../../../../core/theme/text_config.dart';
import '../../../../core/utility/validator.dart';
import '../../../../core/widgets/buttons/rounded_action_buttons.dart';
import '../../../../core/widgets/input_widgets/password_input_field_single.dart';
import '../../../../core/widgets/input_widgets/simple_input_field.dart';
import '../../../../core/widgets/message_with_action.dart';
import '../controllers/sign_up_controller.dart';

class SignUpView extends GetView<SignUpController> {
  const SignUpView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const TitleContent(title: "Sign Up", content: "Lets sign you up with the credentials below"),
              const SizedBox(height: 20),

              SimpleInputField(
                controller: controller.firstNameController,
                hintText: "Enter your First Name",
                errorMessage: "Please enter a valid name",
                fieldTitle: "First Name",
                needTitle: true,
                validatorClass: Validator().validateName,
                prefixIcon: RIcon.User,
              ),
              const SizedBox(height: 15),

              SimpleInputField(
                controller: controller.lastNameController,
                hintText: "Enter your Last Name",
                errorMessage: "Please enter a valid name",
                fieldTitle: "Last Name",
                needTitle: true,
                validatorClass: Validator().validateName,
                prefixIcon: RIcon.User,
              ),
              const SizedBox(height: 15),

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

              SimpleInputField(
                controller: controller.addressController,
                hintText: "Enter your Address",
                errorMessage: "Please enter a valid Address",
                fieldTitle: "Address",
                needTitle: true,
                validatorClass: Validator().validateAddress,
                prefixIcon: RIcon.Map_Point_Add,
              ),
              const SizedBox(height: 15),

              SimpleInputField(
                controller: controller.phoneController,
                inputType: TextInputType.phone,
                hintText: "Enter your Phone Number",
                errorMessage: "Please enter a valid number",
                fieldTitle: "Phone Number",
                needTitle: true,
                validatorClass: Validator().validateBangladeshNumber,
                prefixIcon: RIcon.Phone_Calling_Rounded,
              ),
              const SizedBox(height: 15),

              PasswordInputFieldSingle(
                password: controller.passwordController,
                prefixIcon: RIcon.Lock,
                textInputAction: TextInputAction.next,
                hintText: "Enter your password",
                fieldTitle: "Password",
              ),

              const SizedBox(height: 15),
              PasswordInputFieldSingle(
                password: controller.confirmPasswordController,
                prefixIcon: RIcon.Lock_Keyhole,
                hintText: "Confirm password",
                fieldTitle: "Confirm Password",
              ),

              const SizedBox(height: 15),
              RoundedActionButton(
                onClick: (){},
                title: "Register",
              ),
              const SizedBox(height: 5),
              MessageWithAction(
                message: "Already have an account?",
                buttonText: "Login",
                onClick: () => controller.goToLogin(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
