import 'package:e_commerce/contoller/registration_contoller/registration_controller.dart';
import 'package:e_commerce/view/bottomsheet/bottomsheet.dart';
import 'package:e_commerce/view/login_screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  @override
  Widget build(BuildContext context) {
    final registrationobj = context.watch<RegistrationScreenController>();
    var formkey = GlobalKey<FormState>();
    return Scaffold(
        body: Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Form(
              key: formkey,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 15,
                      ),
                      Text("SIGN UP",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 30)),
                      SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        controller: context
                            .watch<RegistrationScreenController>()
                            .nameController,
                        decoration: InputDecoration(
                            hintText: "Name",
                            labelText: "Name",
                            filled: true,
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(17),
                            )),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        controller: context
                            .watch<RegistrationScreenController>()
                            .emailController,
                        decoration: InputDecoration(
                            hintText: "Email",
                            labelText: "Email",
                            filled: true,
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(17),
                            )),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        controller: context
                            .watch<RegistrationScreenController>()
                            .passController,
                        obscureText: true,
                        decoration: InputDecoration(
                            hintText: "Password",
                            labelText: "Password",
                            filled: true,
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(17),
                            )),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        controller: context
                            .watch<RegistrationScreenController>()
                            .repassController,
                        obscureText: true,
                        decoration: InputDecoration(
                            hintText: "Re Password",
                            labelText: "Re Password",
                            filled: true,
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(17),
                            )),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        controller: context
                            .watch<RegistrationScreenController>()
                            .phonController,
                        decoration: InputDecoration(
                            hintText: "Phone Number",
                            labelText: "Phone Number",
                            filled: true,
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(17),
                            )),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      registrationobj.isLogin
                          ? Center(child: CircularProgressIndicator())
                          : InkWell(
                              onTap: () async {
                                if (formkey.currentState!.validate()) {
                                  if (registrationobj.nameController.text.isNotEmpty &&
                                      registrationobj
                                          .emailController.text.isNotEmpty &&
                                      registrationobj
                                          .passController.text.isNotEmpty &&
                                      registrationobj
                                          .repassController.text.isNotEmpty &&
                                      registrationobj
                                          .phonController.text.isNotEmpty &&
                                      registrationobj.passController.text ==
                                          registrationobj
                                              .repassController.text) {
                                    Provider.of<RegistrationScreenController>(
                                            context,
                                            listen: false)
                                        .onRegistration(context: context)
                                        .then((value) {
                                      if (value == true) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                                content: AlertDialog(
                                          backgroundColor: Colors.green,
                                          content:
                                              Text("Registration successful"),
                                        )));
                                        registrationobj.nameController.clear();
                                        registrationobj.emailController.clear();
                                        registrationobj.passController.clear();
                                        registrationobj.repassController
                                            .clear();
                                        registrationobj.phonController.clear();
                                        Navigator.pushAndRemoveUntil(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  BottomSheetScreen(),
                                            ),
                                            (route) => false);
                                      }
                                    });
                                    // //
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                            content:
                                                Text("Enter valid datas")));
                                  }
                                }
                              },
                              child: Container(
                                width: double.infinity,
                                padding: EdgeInsets.symmetric(vertical: 15),
                                decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.circular(15)),
                                child: Center(
                                    child: Text("REGISTER",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          color: Colors.white,
                                        ))),
                              ),
                            ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Already have account",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              )),
                          TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => LoginScreen(),
                                    ));
                              },
                              child: Text("Login",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                    color: Colors.black,
                                  )))
                        ],
                      )
                    ]),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
