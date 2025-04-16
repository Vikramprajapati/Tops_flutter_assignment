import 'package:get/get.dart';
import 'package:tops_flutter_assignment/Assessment/flutter_deployment_assessment/modules/home/controllers/home_controller.dart';
import 'package:tops_flutter_assignment/Assessment/flutter_deployment_assessment/modules/home/views/home_view.dart';

import 'app_routes.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: AppRoutes.home,
      page: () => const HomeView(),
      binding: BindingsBuilder(() {
        Get.put(HomeController());
      }),
    ),
  ];
}
