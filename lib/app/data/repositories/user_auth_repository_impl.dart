import 'dart:developer';

import 'package:sazim_app/app/core/constant/end_points.dart';
import 'package:sazim_app/app/core/networking/setup/base_client.dart';
import 'package:sazim_app/app/data/dto_model/user_login_model.dart';
import 'package:sazim_app/app/data/dto_model/user_register_model.dart';
import 'package:sazim_app/app/data/models/user_data_model.dart';
import 'package:sazim_app/app/domain/repositories/user_auth_repository.dart';

class UserAuthRepositoryImpl implements UserAuthRepository {
  @override
  Future<UserDataModel?> userLogin({required UserLoginModel userLoginModel}) async {
    UserDataModel? userDataModel;
    try {
      await BaseClient.safeApiCall(
        ApiUrls.login,
        RequestType.post,
        data: userLoginModel.toJson(),
        onSuccess: (response) {
          if (response.statusCode != 200) {
            throw Exception(response.data['error']);
          } else {
            userDataModel = UserDataModel.fromJson(response.data['user']);
          }
        },
      );
      return userDataModel;
    } catch (error) {
      log(error.toString());
      return null;
    }

  }

  @override
  Future<UserDataModel?> userRegister({required UserRegisterModel userRegisterModel}) async {
    UserDataModel? userDataModel;
    try {
      await BaseClient.safeApiCall(
        ApiUrls.register,
        RequestType.post,
        data: userRegisterModel.toJson(),
        onSuccess: (response){
          if(response.statusCode != 201)
            {
              print(response.data);
              throw Exception(response.data['error']);
            }
          else
            {
              userDataModel = UserDataModel.fromJson(response.data);

            }
        },
      );
      return userDataModel;
    } catch (error) {
      log(error.toString());
      return null;
    }

  }

  @override
  Future<void> userLogOut() async{
    /// Api call not required
    log("User Logged out");
  }
}
