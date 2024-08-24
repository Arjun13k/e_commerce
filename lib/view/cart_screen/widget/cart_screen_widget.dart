import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/contoller/cart_contoller/cart_contoller.dart';
import 'package:e_commerce/model/cart_model/cart_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreenWidget extends StatelessWidget {
  const CartScreenWidget({
    super.key,
    this.cartmodel,
    required this.index,
    required this.totalprice,
  });

  final CartModel? cartmodel;
  final int index;
  final double totalprice;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Material(
            elevation: 5,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: ListTile(
                leading: CachedNetworkImage(
                  imageUrl: cartmodel?.productModel.image ?? "",
                  width: 100,
                  fit: BoxFit.contain,
                ),
                title: Text(cartmodel?.productModel.title ?? ""),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          Provider.of<CartContoller>(context, listen: false)
                              .productAmountCalcu(cartmodel!)
                              .toStringAsFixed(2),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          padding: EdgeInsets.symmetric(horizontal: 0),
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 2,
                              color: Colors.red,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: IconButton(
                            onPressed: () {
                              Provider.of<CartContoller>(context, listen: false)
                                  .removeItems(cartmodel!);
                            },
                            icon: Icon(Icons.remove, size: 15),
                          ),
                        ),
                        SizedBox(width: 15),
                        Text(cartmodel?.quantity.toString() ?? ""),
                        SizedBox(width: 15),
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 2,
                              color: Colors.green,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: IconButton(
                            onPressed: () {
                              Provider.of<CartContoller>(context, listen: false)
                                  .addItems(cartmodel!);
                            },
                            icon: Icon(Icons.add, size: 15),
                          ),
                        ),
                        Spacer(),
                        IconButton(
                          onPressed: () {
                            Provider.of<CartContoller>(context, listen: false)
                                .deleteData(index);
                          },
                          icon: Icon(Icons.delete),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
