import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sazim_app/app/core/dependency_injection/dependency_injection.dart';
import 'package:sazim_app/app/core/theme/color_config.dart';
import 'package:sazim_app/app/core/utility/biometric_auth_util.dart';
import 'package:sazim_app/app/core/utility/firebase_message_util.dart';

import 'app/routes/app_pages.dart';

Future<void> loadEnv() async {
  try {
    await dotenv.load(fileName: ".env");
    print(dotenv.env['BASE_URL']);
    if (kDebugMode) {
      print("Environment variables loaded successfully.");
    }
  } catch (e) {
    throw Exception("Failed to load .env file: $e");
  }
}

Future<void> _backgroundHandler(RemoteMessage message) async {
  await FCMUtil.instance.handleBackgroundNotification(message);
}




void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();


  FirebaseMessaging.onBackgroundMessage(_backgroundHandler);
  DependencyInjection.init();
  await GetStorage.init();
  await BiometricAuthUtil.instance.biometricConfig();
  await loadEnv();


  // making the the system top bar transparent
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Teebay Application",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true).copyWith(
        primaryColor: AppColor.primaryDefault,
        canvasColor: AppColor.neutralsBg,
        cardColor: AppColor.neutralCards,
        scaffoldBackgroundColor: AppColor.neutralsBg,
        appBarTheme: AppBarTheme.of(context).copyWith(backgroundColor: AppColor.neutralsBg,centerTitle: false),
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColor.primaryDefault,
          secondary: AppColor.secondaryDefault,
          primary: AppColor.primaryDefault,
        ),

      ),
      // themeMode: ThemeMode.dark,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    );
  }
}

