import 'package:sazim_app/app/data/models/user_data_model.dart';

import '../../data/dto_model/user_login_model.dart';
import '../../data/dto_model/user_register_model.dart';

abstract class UserAuthRepository{
  Future<UserDataModel?> userLogin({required UserLoginModel userLoginModel});
  Future<UserDataModel?> userRegister({required UserRegisterModel userRegisterModel});
  Future<void> userLogOut();
}