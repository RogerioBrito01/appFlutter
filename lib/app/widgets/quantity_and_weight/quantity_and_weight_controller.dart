//criandos o controller(QuantityAndWeightController)
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class QuantityAndWeightController extends GetxController {
  //variavel para reseber a quantidade
  bool isKg;
//passando como parmentro obrigatorio
  QuantityAndWeightController({required this.isKg});
//iniciando a variaval com 1
  num quantity = 1;
  //atalho para usar so o peso

  double get weight => quantity.toDouble();
  late double min;
  late double max;
  final sliderEnabled = false.obs;

  String get label {
    String unit = 'kg';
    String pattern = '0.00';
    var number = weight;

    if (number < 1) {
      number *= 1000;
      unit = 'g';
      pattern = '';
      //verifica se o valor e inteiro se for tira as casas decimais
    } else if (number % number.toInt() == 0) {
      pattern = '';
    }

    return NumberFormat(pattern).format(number) + unit;
  }

  @override
  void onInit() {
    _updateMinAndMax();
    super.onInit();
  }

//metodo que atualiza o valor atraves da funçao update
  void changeQuantity(num value) {
    quantity = value;
    _updateMinAndMax();
    update();
  }

  void changeWeigth(double value) {
    quantity = value;
    update();
  }

  _updateMinAndMax() {
    //minimo e o peso atual -1+0.05
    min = weight - 1 + 0.05;
    //maximo e o peso atual
    max = weight;
    if (min < 0) {
      min = 0.05;
      max = 1;
    }
  }

  //função para habilitar o slider para quando prexionar nele
  void enableSlider() => sliderEnabled.value = true;
}
