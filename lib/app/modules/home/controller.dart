import 'package:get/get.dart';

import '../../data/models/store.dart';
import 'repository.dart';

class HomeController extends GetxController with StateMixin<List<StoreModel>> {
  HomeRepository _repository;

  HomeController(this._repository);

  @override
  void onInit() {
    _repository.getStores().then((data) {
      change(data, status: RxStatus.success());
    }, onError: (error) {
      change(null, status: RxStatus.error(error.toString()));
    });

    super.onInit();
  }
}
