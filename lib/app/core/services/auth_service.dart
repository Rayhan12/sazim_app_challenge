import 'dart:developer';

import 'package:get/get.dart';
import 'package:sazim_app/app/core/utility/biometric_auth_util.dart';
import 'package:sazim_app/app/data/models/user_data_model.dart';
import 'package:sazim_app/app/data/repositories/user_auth_repository_impl.dart';
import 'package:sazim_app/app/domain/repositories/storage_repository.dart';

import '../../data/dto_model/user_login_model.dart';
import '../../data/dto_model/user_register_model.dart';
import '../../domain/repositories/user_auth_repository.dart';
import '../utility/firebase_message_util.dart';

class AuthService extends GetxService {
  final UserAuthRepository userAuthRepository;
  final StorageService storageService;

  AuthService({required this.userAuthRepository, required this.storageService});

  UserDataModel? userDataModel = UserDataModel();
  RxBool hasBiometricEnabled = false.obs;

  final _fcmUtil = FCMUtil.instance;

  RxString fcmToken = "".obs;
  final BiometricAuthUtil authUtil = BiometricAuthUtil.instance;

  @override
  void onInit() {
    hasBiometricEnabled.value = storageService.hasBiometricEnabled();
    //Firebase FCM setup
    _getToken();
    _fcmUtil.configureFCMListeners();

    super.onInit();
  }

  Future<void> _getToken() async {
    await _fcmUtil.initializeFCM().then(
      (value) {
        fcmToken.value = value ?? _fcmUtil.token;
      },
    );
  }

  Future<bool> loginUser({required UserLoginModel userLoginModel}) async {
    try {
      final value = await userAuthRepository.userLogin(userLoginModel: userLoginModel);
      if (value == null) {
        throw Exception("Login Failed, Please try again");
      }
      userDataModel = value;
      storageService.storeEmail(email: userLoginModel.email.toString());
      storageService.storePassword(password: userLoginModel.password.toString());
      return true;

    } catch (error) {
      log("Error", error: error);
      // rethrow;
      return false;
    }
    // return false;
  }

  Future<bool> registerUser({required UserRegisterModel userRegisterModel}) async {
    try {
      final value =  await userAuthRepository.userRegister(userRegisterModel: userRegisterModel);
      if (value == null) {
        throw Exception("Registration Failed, Please try again");
        // return false;
      }
        userDataModel = value;
        storageService.storeEmail(email: userRegisterModel.email.toString());
        storageService.storePassword(password: userRegisterModel.password.toString());
        return true;

    } catch (error) {
      log("Error", error: error);
      return false;
    }
  }

  Future<bool> biometricLogin() async {
    try {
      if (storageService.hasBiometricEnabled()) {
        final isBiometricAuthComplete = await authUtil.isBiometricAuthComplete();

        if (isBiometricAuthComplete) {
          hasBiometricEnabled.value = true;

          // Create the user login model
          UserLoginModel userLoginModel = UserLoginModel(
            email: storageService.getEmail(),
            password: storageService.getPassword(),
          );

          // Attempt login and return the result
          final value =  await loginUser(userLoginModel: userLoginModel);
          print(value);
          return value;

        } else {
          return false; // Biometric auth not completed
        }
      } else {
        hasBiometricEnabled.value = false;
        return false; // Biometric not enabled
      }
    } catch (error) {
      log("Error during biometric login", error: error);
      return false; // Return false on any exception
    }
  }


  bool getBiometricEnabledStatus() => storageService.hasBiometricEnabled();

  void logOut() {
    userDataModel = UserDataModel();
  }
}
