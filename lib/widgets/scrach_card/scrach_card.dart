import 'package:flutter/material.dart';
import 'package:scratcher/scratcher.dart';

class ScratchCardExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Scratch Card Example")),
      body: Center(
        child: Scratcher(
          brushSize: 50,
          threshold: 70,
          onThreshold: () {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text("Congratulations!"),
                content: Text("You won!"),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text("OK"),
                  ),
                ],
              ),
            );
          },
          child: Container(
            width: 300,
            height: 300,
            color: Colors.blue,
            alignment: Alignment.center,
            child: Text(
              "You Won!",
              style: TextStyle(fontSize: 30, color: Colors.white),
            ),
          ),
          color: Colors.grey,
        ),
      ),
    );
  }
}
