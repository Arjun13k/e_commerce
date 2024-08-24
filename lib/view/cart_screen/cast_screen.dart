import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/model/category_model/category_model.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({
    super.key,
    required this.productId,
  });
  final ProductModel productId;

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: CachedNetworkImage(
                height: 200,
                width: 160,
                filterQuality: FilterQuality.high,
                alignment: Alignment.bottomCenter,
                imageUrl: widget.productId.image ?? "",
                scale: 10,
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              " ${widget.productId.category.toString().toUpperCase()}",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              widget.productId.title ?? "",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              widget.productId.description ?? "",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              " ${widget.productId.price.toString()}",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Rating ${widget.productId.rating!.count ?? ""}",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
  }
}
