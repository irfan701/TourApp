import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class NavHomeController {
  //collectionName
  final CollectionReference _refference = FirebaseFirestore.instance
      .collection('all-data')
      .doc(FirebaseAuth.instance.currentUser!.email)
      .collection('images');
  final CollectionReference _carouselImage =
      FirebaseFirestore.instance.collection('carousel-image');

  getData(column_name) {
    return _refference.where(column_name, isEqualTo: true).get();
  }
}
