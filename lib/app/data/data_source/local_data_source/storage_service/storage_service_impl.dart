import 'package:get_storage/get_storage.dart';
import 'package:sazim_app/app/domain/repositories/storage_repository.dart';


class StorageServiceImpl implements StorageService {

  final _storage = GetStorage();

  @override
  String getEmail() {
    return _storage.read("email").toString();
  }

  @override
  String getPassword() {
    return _storage.read("password").toString();
  }

  @override
  void storeEmail({required String email}) {
    _storage.write("email", email);
  }

  @override
  void storePassword({required String password}) {
    _storage.write("password", password);
  }

  @override
  bool hasBiometricEnabled() {
    if(_storage.hasData("email") && _storage.hasData("password")) return true;
    return false;
  }



}