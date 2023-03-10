import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tour_app/controllers/session.dart';
import 'package:tour_app/ui/route/route.dart';
import 'package:tour_app/ui/styles/style.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future chooseScreen() async {
    var userId = Session().getData('uid');
    print(userId);
    if (userId == null) {
      Get.toNamed(onboarding);
    } else {
      Get.toNamed(mainHome);
    }
  }

  @override
  void initState() {
    Future.delayed(Duration(seconds: 3), () => chooseScreen());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Container(
        width: double.maxFinite,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FlutterLogo(
              size: 100.w,
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              "HELLO IRFAN",
              style: AppStyle.myTextStyle,
            ),
          ],
        ),
      )),
    );
  }
}
