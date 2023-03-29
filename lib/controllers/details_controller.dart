import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tour_app/controllers/toast.dart';

class DetailsController {
  final favourite = FirebaseFirestore.instance.collection("users-favourite");
  final email = FirebaseAuth.instance.currentUser!.email;

  getData(image) {
    return favourite
        .doc(email)
        .collection("items")
        .where("fav-image", isEqualTo: image)
        .snapshots();
  }

  addToFavourite(fav_image, fav_destination, fa_cost) {
    favourite.doc(email).collection("items").doc().set(
      {
        'fav-image': fav_image,
        'fav-destination': fav_destination,
        'fa-cost': fa_cost,
      },
    ).whenComplete(() {
      Toastify().success("Added to favourite");
    }).catchError((error) => print("Failed to add user: $error"));
  }
}
