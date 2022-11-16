import 'package:get/get.dart';
import 'package:hortifrut/app/modules/product/page.dart';

import '../modules/dashboard/binding.dart';
import '../modules/dashboard/page.dart';
import '../modules/product/binding.dart';
import '../modules/store/binding.dart';
import '../modules/store/page.dart';

part './routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.dashboard,
      page: () => DashboardPage(),
      binding: DashBoardBinding(),
    ),
    GetPage(
      name: Routes.store,
      page: () => StorePage(),
      binding: StoreBinding(),
    ),
    GetPage(
      name: Routes.product,
      page: () => ProductPage(),
      binding: ProductBinding(),
    ),
  ];
}