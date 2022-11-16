import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';

import 'quantity_and_weight_controller.dart';

class weightWidget extends StatelessWidget {
  var controller = Get.find<QuantityAndWeightController>();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '${NumberFormat.decimalPattern().format(controller.min)}kg}',
          style: Get.textTheme.overline,
        ),
        Expanded(
          child: GestureDetector(
            onTapDown: (details) => controller.enableSlider(),
            child: Slider(
              min: controller.min,
              max: controller.max,
              divisions: 19,
              label: controller.label,
              value: controller.weight,
              onChanged: ((value) {
                if (controller.sliderEnabled.isTrue) {
                  controller.changeWeigth(value);
                }
              }),
            ),
          ),
        ),
        Text(
          '${NumberFormat.decimalPattern().format(controller.max)}kg',
          style: Get.textTheme.overline,
        ),
      ],
    );
  }
}
