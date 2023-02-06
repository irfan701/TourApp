import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget customTextField(label, {maxLine}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(label,
          style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w400)),
      Container(
        decoration: BoxDecoration(
            color: Color(0xFFE9EBED), borderRadius: BorderRadius.circular(7.r)),
        child: TextFormField(
            //controller: controller,
            maxLines: maxLine,
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(left: 20.w))),
      ),
      SizedBox(
        height: 15.h,
      ),
    ],
  );
}
