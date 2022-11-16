import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:transparent_image/transparent_image.dart';

import '../../widgets/quantity_and_weight_widget.dart';
import 'controller.dart';

class ProductPage extends GetView<ProductController> {
  @override
  Widget build(BuildContext context) {
    var product = controller.product.value!;
    return Scaffold(
      appBar: AppBar(title: Text(product.name)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        child: Column(
          children: [
            if (product.image.isNotEmpty)
              Align(
                child: Container(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: FadeInImage.memoryNetwork(
                      placeholder: kTransparentImage,
                      image: product.image,
                    ),
                  ),
                ),
              ),
            if (product.description != null)
              Text(
                product.description!,
                style: Get.textTheme.titleMedium,
              ),
            Text(
              NumberFormat.simpleCurrency().format(product.price) +
                  (product.isKg ? '/kg' : ''),
              style: Get.textTheme.titleLarge,
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Observação'),
              maxLength: 50,
            ),
            Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                border: Border.all(color: Colors.black12, width: 2.0),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Column(
                children: [
                  Text(
                    'Altere a quantidade',
                    style: const TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: 4.0,
                  ),
                  QuantityAndWeightWidget(
                    isKg: product.isKg,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}