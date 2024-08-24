import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginScreenController with ChangeNotifier {
  bool isLoged = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  Future<bool> login({required BuildContext context}) async {
    try {
      isLoged = true;
      notifyListeners();
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text, password: passController.text);

      if (credential.user?.uid != null) {
        isLoged = false;
        notifyListeners();
        return true;
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("No user found for that name")));
        isLoged = false;
        notifyListeners();
        return false;
        // print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Wrong password provided for that user")));

        isLoged = false;
        notifyListeners();
        return false;
        //print('Wrong password provided for that user.');
      }
    } catch (e) {
      isLoged = false;
      notifyListeners();
      return false;
    }
    isLoged = false;
    notifyListeners();
    return false;
  }
}
