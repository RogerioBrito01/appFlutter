import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hortifrut/app/data/models/cart_product.dart';
import 'package:hortifrut/app/data/models/product_model.dart';
import 'package:hortifrut/app/data/services/cart/service.dart';
import 'package:hortifrut/app/modules/product/binding.dart';
import 'package:hortifrut/app/modules/product/widgets/quantity_and_weight/quantity_and_weight_controller.dart';

import '../../data/models/store.dart';

class ProductController extends GetxController {
  final product = Rxn<ProductModel>();
  final store = Rxn<StoreModel>();
  //controller do compo observação
  final observationController = TextEditingController();
  //intanciando o CartService para usar ele.
  final _cartService = Get.find<CartService>();

  @override
  void onInit() {
    product.value = Get.arguments['product'];
    store.value = Get.arguments['store'];
    super.onInit();
  }

// busca o testo digitado pelo usuário no campo observação
  void addToCart() async {
    //Pegando o valor de quantidade pelo controllolador de quantidade
    var quantity = Get.find<QuantityAndWeightController>().quantity;

    if (_cartService.isANewStore(store.value!)) {
      //chamando o dialogo  e passando para a avariavel.
      var startNewCart = await showDialogNewCart();

//se a escolha for iniciar um novo carrinho limpa o atual
      if (startNewCart == true) {
        _cartService.clearCart();
      } else {
        return;
      }
    }

    if (_cartService.products.isEmpty) {
      _cartService.newCart(store.value!);
    }

    //_cartService.newCart(store.value!);
    _cartService.AddProductToCart(CartProductModel(
        product: product.value!,
        quantity: quantity,
        observation: observationController.text));
    //manda mesagem de confirmação que o produto foi adicionado ao carrinho
    ScaffoldMessenger.of(Get.overlayContext!).showSnackBar(SnackBar(
      content: Text(
          'O item ' + product.value!.name + ' foi adicionado no carrinho.'),
    ));
    //tempo de duaração da mesagem ao final volta para a tena anterior
    Future.delayed(const Duration(milliseconds: 300), () => Get.back());
  }

//Mostrar caixa de diálogo Novo carrinho
  Future<dynamic> showDialogNewCart() {
    return Get.dialog(AlertDialog(
      content: const Text(
          'Seu carrinho atual será perdido se adicionar produtos de um novo estabelecimento.'),
      actions: [
        TextButton(onPressed: () => Get.back(), child: const Text('Voltar')),
        TextButton(
            onPressed: () => Get.back(result: true),
            child: const Text('Continuar'))
      ],
    ));
  }
}
