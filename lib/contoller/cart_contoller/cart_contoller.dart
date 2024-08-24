import 'package:e_commerce/model/cart_model/cart_model.dart';
import 'package:e_commerce/model/category_model/category_model.dart';
import 'package:e_commerce/view/homeScreen/ui/cart_ui.dart';
import 'package:flutter/material.dart';

class CartContoller with ChangeNotifier {
  List<CartModel> cartList = [];
  double totalPrice = 0;

  addProduct(ProductModel product, BuildContext context) {
    final isCarted =
        cartList.any((element) => element.productModel.id == product.id);

    if (isCarted) {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CartUi(),
          ));
      print("Already in cart");
    } else {
      cartList.add(CartModel(productModel: product));
    }
    calculation();
    notifyListeners();
  }

  deleteData(int value) {
    cartList.removeAt(value);
    calculation();
    notifyListeners();
  }

  addItems(CartModel model) {
    model.quantity++;
    calculation();
    notifyListeners();
  }

  removeItems(CartModel model) {
    if (model.quantity <= 1) {
      print("Minimum Quantity required");
    } else {
      model.quantity--;
    }
    calculation();
    notifyListeners();
  }

  double productAmountCalcu(CartModel model) {
    double total = 0;
    return total += model.productModel.price! * model.quantity;
  }

  calculation() {
    totalPrice = 0;
    for (var items in cartList) {
      totalPrice =
          totalPrice + (items.quantity * (items.productModel.price ?? 0));
    }
    ;

    notifyListeners();
  }

  grandTotal() {
    calculation();
    totalPrice;
    notifyListeners();
  }
}
