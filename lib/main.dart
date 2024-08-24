import 'package:e_commerce/contoller/cart_contoller/cart_contoller.dart';
import 'package:e_commerce/contoller/category_controller/category_controller.dart';
import 'package:e_commerce/contoller/login_contoller/login_contoller.dart';
import 'package:e_commerce/contoller/registration_contoller/registration_controller.dart';
import 'package:e_commerce/contoller/search_controller/search_contoller.dart';
import 'package:e_commerce/firebase_options.dart';
import 'package:e_commerce/view/login_screen/login_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(ECommerceApp());
}

class ECommerceApp extends StatelessWidget {
  const ECommerceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ProductController()),
        ChangeNotifierProvider(create: (context) => SearchCOntroller()),
        ChangeNotifierProvider(create: (context) => CartContoller()),
        ChangeNotifierProvider(create: (context) => LoginScreenController()),
        ChangeNotifierProvider(
            create: (context) => RegistrationScreenController()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: LoginScreen(),
      ),
    );
  }
}
