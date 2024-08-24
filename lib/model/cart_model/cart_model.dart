import 'package:e_commerce/model/category_model/category_model.dart';

class CartModel {
  int quantity;
  final ProductModel productModel;
  CartModel({
    required this.productModel,
    this.quantity = 1,
  });
}
