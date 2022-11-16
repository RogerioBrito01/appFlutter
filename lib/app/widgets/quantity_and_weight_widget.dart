import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class QuantityAndWeightWidget extends StatelessWidget {
  //variavel comm a quantidade
  bool isKg;
//definindo como padrão isKG falso
  QuantityAndWeightWidget({this.isKg = false});
//chamando o widget pessonalisado de quantidade
  @override
  Widget build(BuildContext context) {
    //definindo o tipo como QuantityAndWeightController
    return GetBuilder<QuantityAndWeightController>(
      //iniciandi o controller do valor
      init: QuantityAndWeightController(isKg: isKg),
      builder: (controller) => Column(
        children: [
          QuantityWidget(),
        ],
      ),
    );
  }
}

//criando o widiget personalinalizado
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
          width: 60.0,
          padding: const EdgeInsets.all(8.0),
          child: Text(
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

//criando o controller(QuantityAndWeightController)
class QuantityAndWeightController extends GetxController {
  //variavel para reseber a quantidade
  bool isKg;
//passando como parmentro obrigatorio
  QuantityAndWeightController({required this.isKg});
//iniciando a variaval com 1
  num quantity = 1;
//metodo que atualiza o valor atraves da funçao update
  void changeQuantity(num value) {
    quantity = value;

    update();
  }
}
