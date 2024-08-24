// import 'dart:convert';

// import 'package:e_commerce/model/category_model/category_model.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// class ProductController with ChangeNotifier {
//   bool isloading = false;
//   List<ProductModel> categoryList = [];

//   Future<void> getProduct() async {
//     isloading = true;
//     notifyListeners();
//     Uri uri = Uri.parse("https://fakestoreapi.com/products");

//     try {
//       final response = await http.get(uri);

//       if (response.statusCode == 200) {
//         final decodedData = jsonDecode(response.body);
//         if (decodedData != null && decodedData['data'] != null) {
//           // Parse data array into the categoryList
//           categoryList = List<ProductModel>.from(
//               decodedData['data'].map((x) => ProductModel.fromJson(x)));
//         }
//       } else {
//         print(
//             "Failed to fetch categories. Status Code: ${response.statusCode}");
//       }
//     } catch (e) {
//       print("Error occurred while fetching categories: $e");
//     }

//     isloading = false;
//     notifyListeners();
//   }
// }
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:e_commerce/model/category_model/category_model.dart';

class ProductController with ChangeNotifier {
  bool isLoading = false;
  List<ProductModel> categoryList = [];

  Future<void> getProduct() async {
    isLoading = true;
    notifyListeners();
    Uri uri = Uri.parse("https://fakestoreapi.com/products");

    try {
      final response = await http.get(uri);

      if (response.statusCode == 200) {
        final List<dynamic> decodedData = jsonDecode(response.body);
        categoryList =
            decodedData.map((data) => ProductModel.fromJson(data)).toList();
      } else {
        print("Failed to fetch products. Status Code: ${response.statusCode}");
      }
    } catch (e) {
      print("Error occurred while fetching products: $e");
    }

    isLoading = false;
    notifyListeners();
  }

  List images = [
    "https://static.vecteezy.com/system/resources/previews/000/267/866/original/vector-special-offer-creative-sale-banner-design.jpg",
    "https://static.vecteezy.com/system/resources/previews/000/178/364/original/super-sale-offer-and-discount-banner-template-for-marketing-and-vector.jpg",
    "https://static.vecteezy.com/system/resources/previews/000/176/401/original/vector-super-sale-offer-template-for-advertising-with-geometric-colorfu.jpg"
  ];
  List Categorys = [
    "electronics",
    "jewelery",
    "men's clothing",
    "women's clothing"
  ];
}
