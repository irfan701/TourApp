import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tour_app/ui/route/route.dart';
import 'package:tour_app/ui/widgets/custom_text_field.dart';
import 'package:tour_app/ui/widgets/violet_btn.dart';

class NavAdd extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.only(left: 25.w, right: 25.w, top: 10.h),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                'Fill out the form and start the journey',
                style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w300),
              ),
              SizedBox(
                height: 20.h,
              ),
              customTextField("Owner Name"),
              customTextField("Description"),
              customTextField("Cost"),
              customTextField("Facilities", maxLine: 4),
              customTextField("Destination"),
              SizedBox(
                height: 28.h,
              ),
              VioletBtn('Next', () => Get.toNamed(navAddLastStep))
            ],
          ),
        ),
      ),
    );
  }
}
