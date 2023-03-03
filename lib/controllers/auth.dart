import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:tour_app/ui/route/route.dart';

class Auth {
  static onRegistration(email, pass) async {
    try {
      var userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: pass,
      );
      var authCredential = userCredential.user;
      if (authCredential!.uid.isNotEmpty) {
        Fluttertoast.showToast(
          msg: 'Registration Successfull',
        );
        Get.toNamed(userForm);
      } else {
        print("sign up failed");
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Fluttertoast.showToast(msg: 'The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        Fluttertoast.showToast(
            msg: 'The account already exists for that email.');
      }
    } catch (e) {
      Fluttertoast.showToast(msg: 'Error is: $e');
    }
  }
}
