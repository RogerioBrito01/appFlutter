import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'quantity_and_weight_controller.dart';
import 'quantity_widget.dart';
import 'weight_widget.dart';

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
        children: [QuantityWidget(), if (isKg) weightWidget()],
      ),
    );
  }
}

//criando o widiget personalinalizado
