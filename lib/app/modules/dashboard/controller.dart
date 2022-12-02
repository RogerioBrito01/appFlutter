import 'package:get/get.dart';

class DashboardController extends GetxController {
  //contador de paginas por index
  var currentPageIndex = 0.obs;
  void changePageIndex(int index) {
    currentPageIndex.value = index;
  }
}
