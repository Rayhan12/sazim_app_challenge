import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:get/get.dart';
import 'package:sazim_app/app/core/theme/color_config.dart';

import 'app/routes/app_pages.dart';

Future<void> loadEnv() async {
  try {
    await dotenv.load(fileName: ".env");
    if (kDebugMode) {
      print("Environment variables loaded successfully.");
    }
  } catch (e) {
    throw Exception("Failed to load .env file: $e");
  }
}



void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await loadEnv();
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
      themeMode: ThemeMode.dark,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    );
  }
}

