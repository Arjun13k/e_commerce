import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegistrationScreenController with ChangeNotifier {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController repassController = TextEditingController();
  TextEditingController phonController = TextEditingController();
  bool isLogin = false;

  Future<bool> onRegistration({required BuildContext context}) async {
    try {
      isLogin = true;
      notifyListeners();
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passController.text,
      );
      await credential.user?.updateDisplayName(nameController.text);
      if (credential.user?.uid != null) {
        isLogin = false;
        notifyListeners();
        return true;
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("The password provided is too weak")));
        // print('The password provided is too weak.');
        isLogin = false;
        notifyListeners();
        return false;
      } else if (e.code == 'email-already-in-use') {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text("The account already exists for that email")));
        emailController.clear();
        passController.clear();
        repassController.clear();
        phonController.clear();
        nameController.clear();

        isLogin = false;
        notifyListeners();
        return false;
        // print('The account already exists for that email.');
      }
    } catch (e) {
      isLogin = false;
      notifyListeners();
      return false;
      // print(e);
    }
    isLogin = false;
    notifyListeners();
    return false;
  }
}
