import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget drawerItemWd(String itemName, onTap) {
  return InkWell(
    onTap: onTap,
    child: Text(
      itemName,
      style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w400),
    ),
  );
}
