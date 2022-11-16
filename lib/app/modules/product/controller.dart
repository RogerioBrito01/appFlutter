import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:hortifrut/app/data/models/product_model.dart';
import 'package:hortifrut/app/modules/product/binding.dart';

import '../../data/models/store.dart';

class ProductController extends GetxController {
  final product = Rxn<ProductModel>();
  final store = Rxn<StoreModel>();
  //controller do compo observação
  final observationController = TextEditingController();

  @override
  void onInit() {
    product.value = Get.arguments['product'];
    store.value = Get.arguments['store'];
    super.onInit();
  }

// busca o testo digitado pelo usuário no campo observação
  void addToCart() {
    observationController.text;
  }
}
