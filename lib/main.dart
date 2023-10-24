import 'package:aaya/controller/user_controller.dart';
import 'package:aaya/screens/splash/splash_screen.dart';
import 'package:aaya/services/dio_service.dart';
import 'package:aaya/theme/theme_controller.dart';
import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

Dio? dioInstance;

void main() async {
  dioInstance = createDioWithLoggerInterceptor();
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  await Hive.initFlutter();
  await Hive.openBox('tokenBox');
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.put(UserController());
    final ThemeController themeController = Get.put(ThemeController());
    return Obx(
      () => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home: const SplashScreen(),
        title: 'Aaya',
        theme: themeController.theme,
        themeMode: ThemeMode.system,
        initialBinding: BindingsBuilder(() {
          Get.lazyPut(() => themeController);
        }),
      ),
    );
  }
}
