import 'package:aaya/screens/home/home_screen.dart';
import 'package:aaya/services/dio_service.dart';
import 'package:aaya/theme/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  createDioWithLoggerInterceptor();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.put(ThemeController());
    return Obx(() => GetMaterialApp(
          debugShowCheckedModeBanner: false,
          home: const HomeScreen(),
          title: 'Aaya',
          theme: themeController.theme,
          themeMode: ThemeMode.system,
          initialBinding: BindingsBuilder(() {
            Get.lazyPut(() => themeController);
          }),
        ));
  }
}
