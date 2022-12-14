import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hortifrut/app/data/services/cart/service.dart';

import '../../data/models/cart_product.dart';
import '../../data/models/store.dart';

class CartController extends GetxController {
  //intanciando o service do cart
  final _cartService = Get.find<CartService>();
  //criando a lista de poducts

  List<CartProductModel> get products => _cartService.products;
  final observationController = TextEditingController();

  StoreModel? get store => _cartService.store.value;
  //recupera testo da observação.
  @override
  void onInit() {
    observationController.text = _cartService.observation.value;

    observationController.addListener(() {
      _cartService.observation.value = observationController.text;
    });

    super.onInit();
  }

  void removeProduct(CartProductModel cartProduct) {
    _cartService.removeProductFromCart(cartProduct);
  }
}
