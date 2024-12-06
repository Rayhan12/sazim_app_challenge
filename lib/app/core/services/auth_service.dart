import 'dart:developer';

import 'package:get/get.dart';
import 'package:sazim_app/app/data/models/user_data_model.dart';
import 'package:sazim_app/app/data/repositories/user_auth_repository_impl.dart';

import '../../data/dto_model/user_login_model.dart';
import '../../data/dto_model/user_register_model.dart';
import '../../domain/repositories/user_auth_repository.dart';

class AuthService extends GetxService{
  final UserAuthRepository userAuthRepository;
  AuthService({required this.userAuthRepository});

  UserDataModel? userDataModel = UserDataModel();

  Future<void> loginUser({required UserLoginModel userLoginModel}) async{
    try{
      await userAuthRepository.userLogin(userLoginModel: userLoginModel).then((value) {
        print(value);
        userDataModel = value ?? UserDataModel();
      },);
      print(userDataModel);
    }
    catch(error)
    {
      log("Error", error: error);
    }
  }

  Future<void> registerUser({required UserRegisterModel userRegisterModel}) async{
    try{
      userDataModel = await userAuthRepository.userRegister(userRegisterModel: userRegisterModel);
    }
    catch(error)
    {
      log("Error", error: error);
    }
  }

}