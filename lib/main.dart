import 'package:aaya/controller/user_controller.dart';
import 'package:aaya/screens/auth/login_screen.dart';
import 'package:aaya/services/dio_service.dart';
import 'package:aaya/theme/theme_controller.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Dio? dioInstance;

void main() {
  dioInstance = createDioWithLoggerInterceptor();
  runApp(const MyApp());
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
        home: const LoginScreen(),
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
