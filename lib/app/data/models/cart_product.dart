import 'package:get/get_connect/http/src/request/request.dart';
import 'package:hortifrut/app/data/models/product_model.dart';

class CartProductModel {
  ProductModel product;
  num quantity;
  String? observation;
  CartProductModel({
    required this.product,
    required this.quantity,
    this.observation,
  });
  num get total => product.price * quantity;
}
