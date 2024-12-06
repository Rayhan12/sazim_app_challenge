import 'package:local_auth/local_auth.dart';
import 'package:local_auth_android/local_auth_android.dart';
import 'package:local_auth_darwin/local_auth_darwin.dart';

class BiometricAuthUtil{

  /// Using singleton pattern because only one instance is required
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

  Future<bool> isBiometricAuthComplete()async{
    return await _auth.authenticate(
        localizedReason: 'Login to the system using biometric auth',
        authMessages: const <AuthMessages>[
          AndroidAuthMessages(
            signInTitle: "Let's login",
            cancelButton: 'No thanks',
          ),
          IOSAuthMessages(
            cancelButton: 'No thanks',
          ),
        ]);
  }

}