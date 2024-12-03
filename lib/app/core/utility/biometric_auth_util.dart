import 'package:local_auth/local_auth.dart';

class BiometricAuthUtil{

  BiometricAuthUtil._internal();

  static final BiometricAuthUtil _instance = BiometricAuthUtil._internal();

  static BiometricAuthUtil get instance => _instance;

  bool _biometricAvailable = false;
  final LocalAuthentication _auth = LocalAuthentication();


  bool get biometricStatus => _biometricAvailable;

  ///Call on app init
  Future<void> biometricConfig() async{
    try
      {
        final bool canAuthenticateWithBiometrics = await _auth.canCheckBiometrics;
        _biometricAvailable = canAuthenticateWithBiometrics || await _auth.isDeviceSupported();
      }
      catch(error){
        throw Exception(error);
      }
  }

  /// Todo: Login with Biometric selection option

}