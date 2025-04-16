import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tops_flutter_assignment/Assessment/flutter_deployment_assessment/app/routes/app_routes.dart';
import 'app/routes/app_pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Cash Calculator',
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.green),
      initialRoute: AppRoutes.home,
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
    );
  }
}
