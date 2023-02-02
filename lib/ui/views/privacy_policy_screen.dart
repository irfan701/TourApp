import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:tour_app/ui/views/main_home_screen.dart';

import '../../const/app_color.dart';
import '../route/route.dart';
import '../styles/style.dart';
import '../widgets/violet_btn.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: EdgeInsets.only(left: 30.w, right: 30.w, top: 20.h),
        child: Column(
          children: [
            Expanded(
                child: Container(
              color: Colors.green,
            )),
            VioletBtn('Submit', () => Get.toNamed(mainHome)),
            SizedBox(
              height: 10.h,
            )
          ],
        ),
      ),
    ));
  }
}
