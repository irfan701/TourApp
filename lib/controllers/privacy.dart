import 'package:cloud_firestore/cloud_firestore.dart';

class PrivacyController {
  getData() {
    return FirebaseFirestore.instance
        .collection('privacy')
        .doc('T30doKPmvxQraRKWWEMe')
        .snapshots();
  }
}
