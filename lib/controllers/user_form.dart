import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:tour_app/controllers/toast.dart';
import 'package:tour_app/ui/route/route.dart';

class UserForm {
  final _auth = FirebaseAuth.instance;

  CollectionReference usersForm =
      FirebaseFirestore.instance.collection('users-form-data');

  Future onInsert(name, phone, address, dob, gender) async {
    try {
      usersForm.doc(_auth.currentUser!.email).set({
        'name': name,
        'phone': phone,
        'address': address,
        'dob': dob,
        'gender': gender,
      }).whenComplete(() {
        Toastify().success("Added Success");
        Get.toNamed(privacyPolicy);
      });
    } catch (error) {
      print("Failed to add user: $error");
    }
  }
}
