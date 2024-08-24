import 'dart:core';

import 'package:e_commerce/contoller/cart_contoller/cart_contoller.dart';
import 'package:e_commerce/view/cart_screen/widget/cart_screen_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:io';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:path_provider/path_provider.dart'; // for saving the file locally

import 'package:e_commerce/model/cart_model/cart_model.dart';

class CartUi extends StatefulWidget {
  const CartUi({super.key});

  @override
  State<CartUi> createState() => _CartUiState();
}

class _CartUiState extends State<CartUi> {
  @override
  Widget build(BuildContext context) {
    Future<void> generatePdf(List<CartModel> cartList) async {
      final pdf = pw.Document();

      // Calculate total amount
      double totalAmount = cartList.fold(0.0, (sum, cartModel) {
        return sum + (cartModel.productModel.price! * cartModel.quantity);
      });

      // Add content to the PDF document
      pdf.addPage(
        pw.Page(
          build: (pw.Context context) => pw.Column(
            children: [
              pw.Text(
                'Cart List',
                style:
                    pw.TextStyle(fontSize: 24, fontWeight: pw.FontWeight.bold),
              ),
              pw.SizedBox(height: 20),
              pw.Table.fromTextArray(
                headers: ['Product', 'Price', 'Quantity', 'Total Price'],
                data: cartList.map((cartModel) {
                  return [
                    cartModel.productModel.title ?? "",
                    "\$${cartModel.productModel.price?.toStringAsFixed(2) ?? '0.00'}",
                    cartModel.quantity.toString(),
                    "\$${(cartModel.productModel.price! * cartModel.quantity).toStringAsFixed(2)}"
                  ];
                }).toList(),
              ),
              pw.SizedBox(height: 20),
              pw.Text(DateTime.now().toString()),
              pw.Text(
                'Total Amount: \$${totalAmount.toStringAsFixed(2)}',
                style:
                    pw.TextStyle(fontSize: 18, fontWeight: pw.FontWeight.bold),
              ),
            ],
          ),
        ),
      );

      // Save the PDF to a file
      final output = await getTemporaryDirectory();
      final file = File("${output.path}/cart_details.pdf");
      await file.writeAsBytes(await pdf.save());

      // Print or Share PDF
      await Printing.sharePdf(
          bytes: await pdf.save(), filename: 'cart_details.pdf');
    }

    final cartProvider = Provider.of<CartContoller>(context);
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Container(
            child: Expanded(
              child: ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context, index) => CartScreenWidget(
                        cartmodel: cartProvider.cartList[index],
                        index: index,
                        totalprice: cartProvider.totalPrice,
                      ),
                  separatorBuilder: (context, index) => SizedBox(
                        height: 10,
                      ),
                  itemCount: cartProvider.cartList.length),
            ),
            //  Column(
            //   children: [
            //     Text("total amount"),
            //     SizedBox(
            //       height: 10,
            //     ),
            //     Padding(
            //       padding: const EdgeInsets.symmetric(horizontal: 10),
            //       child: Row(
            //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //         children: [

            //         ],
            //       ),
            //     )
            //   ],
            // ),
          ),
          Material(
            elevation: 5,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
              padding: EdgeInsets.only(top: 10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "Total items in list",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      Text(cartProvider.cartList.length.toString(),
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18)),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "Total Amount",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      Text(cartProvider.totalPrice.toStringAsFixed(2),
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18)),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                  //   children: [
                  //     Text(
                  //       "Shipping Charge",
                  //       style: TextStyle(
                  //           fontWeight: FontWeight.bold, fontSize: 18),
                  //     ),
                  //     Text(20.toString(),
                  //         style: TextStyle(
                  //             fontWeight: FontWeight.bold, fontSize: 18)),
                  //   ],
                  // ),
                  // SizedBox(
                  //   height: 20,
                  // ),
                  Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "Total",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 30),
                      ),
                      Text(cartProvider.totalPrice.toStringAsFixed(2),
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 30)),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      generatePdf(cartProvider.cartList);
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 15),
                      decoration: BoxDecoration(color: Colors.green),
                      width: double.infinity,
                      child: Center(
                          child: Text(
                        "Procced",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      )),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
