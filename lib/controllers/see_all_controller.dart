import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SeeAllController {
  //var email = FirebaseAuth.instance.currentUser!.email;
  final _refference = FirebaseFirestore.instance
      .collection('all-data')
      .doc(FirebaseAuth.instance.currentUser!.email)
      .collection('images');

  getData(widget_compare) {
    return _refference.where(widget_compare, isEqualTo: true).get();
  }
}
