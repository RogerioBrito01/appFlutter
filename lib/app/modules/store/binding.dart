import 'package:get/get.dart';
import 'package:hortifrut/app/modules/store/repository.dart';

import '../../data/providers/api.dart';
import 'controller.dart';

class StoreBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StoreController>(
        () => StoreController(StoreRepository(Get.find<Api>())));
  }
}
