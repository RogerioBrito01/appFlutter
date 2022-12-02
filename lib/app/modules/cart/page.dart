import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../data/models/cart_product.dart';
import 'controller.dart';

class CartPage extends GetView<CartController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Carrinho')),
      body: SingleChildScrollView(
        child: Obx(() => Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 16.0),
                  child: TextField(
                    controller: controller.observationController,
                    decoration: const InputDecoration(
                      labelText: 'Observação',
                    ),
                    maxLength: 80,
                  ),
                ),
                //verifica se diferente de null
                if (controller.store != null)
                  Align(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 16.0),
                      child: Text(controller.store!.name),
                    ),
                  ),
                for (var cartProduct in controller.products)
                  ListTile(
                    title: Text(cartProduct.product.name),
                    subtitle: Text(
                        '${NumberFormat.simpleCurrency().format(cartProduct.total)} (${NumberFormat.simpleCurrency().format(cartProduct.product.price)})'),
                    leading: _buildProductQuantity(cartProduct),
                    trailing: IconButton(
                        onPressed: () => controller.removeProduct(cartProduct),
                        icon: const Icon(Icons.delete)),
                  ),
                if (controller.products.isEmpty)
                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text('Seu carrinho está vazio'),
                  )
                else
                  ElevatedButton(
                      onPressed: () {}, child: const Text('Avançar')),
              ],
            )),
      ),
    );
  }

//somar as quantidades compradas
  Widget _buildProductQuantity(CartProductModel cartProduct) {
    return Text(NumberFormat.decimalPattern().format(cartProduct.quantity) +
        (cartProduct.product.isKg ? 'kg' : 'x'));
  }
}
