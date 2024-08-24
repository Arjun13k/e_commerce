import 'package:e_commerce/view/homeScreen/ui/home_ui.dart';
import 'package:e_commerce/view/person/person.dart';
import 'package:flutter/material.dart';

class BottomSheetScreen extends StatefulWidget {
  const BottomSheetScreen({super.key});

  @override
  State<BottomSheetScreen> createState() => _BottomSheetScreenState();
}

class _BottomSheetScreenState extends State<BottomSheetScreen> {
  int indexValue = 0;
  final List screen = [HomeScreenUi(), Person()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screen[indexValue],
      bottomNavigationBar: BottomNavigationBar(
          onTap: (value) {
            setState(() {
              indexValue = value;
            });
          },
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.black,
          currentIndex: indexValue,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home_filled), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_pin), label: "Profile")
          ]),
    );
  }
}
