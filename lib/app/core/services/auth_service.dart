import 'dart:developer';

import 'package:get/get.dart';
import 'package:sazim_app/app/core/utility/biometric_auth_util.dart';
import 'package:sazim_app/app/data/models/user_data_model.dart';
import 'package:sazim_app/app/data/repositories/user_auth_repository_impl.dart';
import 'package:sazim_app/app/domain/repositories/storage_repository.dart';

import '../../data/dto_model/user_login_model.dart';
import '../../data/dto_model/user_register_model.dart';
import '../../domain/repositories/user_auth_repository.dart';

class AuthService extends GetxService{
  final UserAuthRepository userAuthRepository;
  final StorageService storageService;
  AuthService({required this.userAuthRepository, required this.storageService});

  UserDataModel? userDataModel = UserDataModel();
  RxBool hasBiometricEnabled = false.obs;

  final BiometricAuthUtil authUtil = BiometricAuthUtil.instance;

  @override
  void onInit() {
    hasBiometricEnabled.value = storageService.hasBiometricEnabled();
    super.onInit();
  }

  Future<void> loginUser({required UserLoginModel userLoginModel}) async{
    try{
      await userAuthRepository.userLogin(userLoginModel: userLoginModel).then((value) {
        userDataModel = value ?? UserDataModel();
        storageService.storeEmail(email: userLoginModel.email.toString());
        storageService.storePassword(password: userLoginModel.password.toString());
      },);
    }
    catch(error)
    {
      log("Error", error: error);
    }
  }

  Future<void> registerUser({required UserRegisterModel userRegisterModel}) async{
    try{
      await userAuthRepository.userRegister(userRegisterModel: userRegisterModel).then((value) {
        userDataModel = value ?? UserDataModel();
        storageService.storeEmail(email: userRegisterModel.email.toString());
        storageService.storePassword(password: userRegisterModel.password.toString());
      },);

    }
    catch(error)
    {
      log("Error", error: error);
    }
  }

  Future<bool> biometricLogin()async{
    try{
      if(storageService.hasBiometricEnabled())
        {
          await authUtil.isBiometricAuthComplete().then((value) {
            if(value)
              {
                hasBiometricEnabled.value = true;
                UserLoginModel userLoginModel = UserLoginModel(
                    email: storageService.getEmail(),
                    password: storageService.getPassword()
                );
                loginUser(userLoginModel: userLoginModel).then((value) {
                  return true;
                },);
              }
            else {
              return false;
            }
          },);
        }
      else
        {
          hasBiometricEnabled.value = false;
          return false;
        }
      return true;
    }
    catch(error)
    {
      log("Error", error: error);
      return false;
    }
  }

  bool getBiometricEnabledStatus()=> storageService.hasBiometricEnabled();

  void logOut(){
    userDataModel = UserDataModel();
  }



}