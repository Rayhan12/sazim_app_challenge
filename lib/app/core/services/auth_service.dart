import 'dart:developer';

import 'package:get/get.dart';
import 'package:sazim_app/app/data/models/user_data_model.dart';
import 'package:sazim_app/app/data/repositories/user_auth_repository_impl.dart';

import '../../data/dto_model/user_login_model.dart';
import '../../data/dto_model/user_register_model.dart';

class AuthService extends GetxService{
  final UserAuthRepositoryImpl userAuthRepositoryImpl;
  AuthService({required this.userAuthRepositoryImpl});

  UserDataModel? userDataModel = UserDataModel();

  Future<void> loginUser({required UserLoginModel userLoginModel}) async{
    try{
      userDataModel = await userAuthRepositoryImpl.userLogin(userLoginModel: userLoginModel);
    }
    catch(error)
    {
      log("Error", error: error);
    }
  }

  Future<void> registerUser({required UserRegisterModel userRegisterModel}) async{
    try{
      userDataModel = await userAuthRepositoryImpl.userRegister(userRegisterModel: userRegisterModel);
    }
    catch(error)
    {
      log("Error", error: error);
    }
  }

}