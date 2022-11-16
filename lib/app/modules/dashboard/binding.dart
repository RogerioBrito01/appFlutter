import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

import '../../data/providers/api.dart';
import '../home/controller.dart';
import '../home/repository.dart';
import 'controller.dart';

class DashBoardBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboardController>(() => DashboardController());
    Get.lazyPut<HomeController>(
        () => HomeController(HomeRepository(Get.find<Api>())));
  }
}
