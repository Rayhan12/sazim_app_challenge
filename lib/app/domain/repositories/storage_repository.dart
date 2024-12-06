
abstract class StorageService {
  void storeEmail({required String email});
  void storePassword({required String password});
  String getEmail();
  String getPassword();
  bool hasBiometricEnabled();
}