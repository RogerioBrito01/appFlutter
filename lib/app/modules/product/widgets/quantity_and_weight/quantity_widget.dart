import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';

import 'quantity_and_weight_controller.dart';

class QuantityWidget extends StatelessWidget {
  //passando o valor do QuantityAndWeightController para a variavel controller
  var controller = Get.find<QuantityAndWeightController>();

  @override
  Widget build(BuildContext context) {
    // coloca o valor da variavel controller em quantity
    var isKg = controller.isKg;
    var quantity = controller.quantity;

    return Row(
      mainAxisSize: MainAxisSize.min,
      //criando os botões em linha  chamando a funçao par realizar o contador para mais e para menos
      children: [
        ElevatedButton(
          onPressed: quantity > 1
              ? () => controller.changeQuantity(quantity - 1)
              : null,
          child: const Icon(Icons.remove),
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(0),
            minimumSize: const Size(40, 40),
          ),
        ),
        Container(
          width: isKg ? 96.0 : 48.0,
          padding: const EdgeInsets.all(8.0),
          child: Text(
            //se for quantidades em kg aparece a kg se não fica limpo
            NumberFormat.decimalPattern().format(quantity) + (isKg ? 'kg' : ''),
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        ElevatedButton(
          onPressed: () => controller.changeQuantity(quantity + 1),
          child: const Icon(Icons.add),
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(0),
            minimumSize: const Size(40, 40),
          ),
        )
      ],
    );
  }
}
