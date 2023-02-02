import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

_exitDialog(context, String title, onPressed) {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: Row(
            children: [
              ElevatedButton(onPressed: onPressed, child: Text("No")),
              SizedBox(
                width: 20.w,
              ),
              ElevatedButton(onPressed: onPressed, child: Text("Yes")),
            ],
          ),
        );
      });
}
