import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppStyle {
  static TextStyle myTextStyle =
      TextStyle(fontWeight: FontWeight.w600, fontSize: 20.sp);

  // formInputDecoration(hintText, fontSize, fontWeight) {
  //   InputDecoration(
  //       hintText: hintText,
  //       hintStyle: TextStyle(fontSize: fontSize, fontWeight: fontWeight));
  // }

  static InputDecoration textFieldDecoration(hint) => InputDecoration(
      hintText: hint,
      hintStyle: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w400));

  static progressDialog(context) => showDialog(
        context: context,
        builder: (_) => Dialog(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircularProgressIndicator(),
                Text("Processing"),
              ],
            ),
          ),
        ),
      );
}
