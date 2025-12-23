import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prime_derma_blog/utils/initial_bindings.dart';
import 'package:prime_derma_blog/utils/routes/app_routes.dart';

void main() {
  runApp(MyApp(initialRoute: AppRoutes.initialRoute));
}

class MyApp extends StatelessWidget {
  final String initialRoute;
  const MyApp({super.key, required this.initialRoute});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: initialRoute,
      transitionDuration: const Duration(milliseconds: 400),
      popGesture: true,
      debugShowMaterialGrid: false,
      debugShowCheckedModeBanner: false,
      locale: Get.deviceLocale,
      fallbackLocale: const Locale('en', 'US'),
      title: 'Prime Derma',
      initialBinding: InitialBindings(),
      getPages: AppRoutes.pages,
    );
  }
}
