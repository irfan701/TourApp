import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tour_app/ui/widgets/custom_text_field.dart';
import 'package:tour_app/ui/widgets/violet_btn.dart';

class NavAddLastStep extends StatelessWidget {
  const NavAddLastStep({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(left: 25.w, right: 25.w, top: 60.h),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  customTextField("Phone Number"),
                  customTextField("Destination Date & Time"),
                  Text(
                    "Choose Images",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18.sp,
                    ),
                  ),
                  Container(
                    height: 100.h,
                    decoration: BoxDecoration(
                      color: Color(0xFFE9EBED),
                      borderRadius: BorderRadius.circular(7.r),
                    ),
                    child: Center(
                      child: FloatingActionButton(
                        onPressed: () {},
                        child: const Icon(Icons.add),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50.h,
                  ),
                  VioletBtn(
                    "Upload",
                    () {},
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
