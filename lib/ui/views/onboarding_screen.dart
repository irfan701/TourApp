import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:tour_app/const/app_color.dart';
import 'package:tour_app/ui/route/route.dart';
import 'package:tour_app/ui/styles/style.dart';

class OnboardingScreen extends StatelessWidget {
  // const OnboardingScreen({super.key});

  List _lottieFiles = [
    'assets/files/welcome.json',
    'assets/files/category.json',
    'assets/files/support.json',
  ];
  List _title = ['Welcome', 'Categories', 'Support'];
  List _description = [
    'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
    'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
    'Lorem Ipsum is simply dummy text of the printing and typesetting industry.'
  ];
  var _currentIndex = 0.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(32.w),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Obx(() => Expanded(
                flex: 2,
                child: Lottie.asset(_lottieFiles[_currentIndex.toInt()]))),
            Expanded(
                flex: 1,
                child: Container(
                  decoration: BoxDecoration(
                      color: AppColor.scaffoldColor,
                      //  borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderRadius: BorderRadius.circular(10.r),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black26,
                            offset: Offset(4.0, 4.0),
                            blurRadius: 10,
                            spreadRadius: 1.0),
                        BoxShadow(
                            color: Colors.white,
                            offset: Offset(-4.0, -4.0),
                            blurRadius: 5,
                            spreadRadius: 1.0),
                      ]),
                  child: Padding(
                    padding: EdgeInsets.all(30.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Obx(
                          () => Text(
                            _title[_currentIndex.toInt()],
                            style: AppStyle.myTextStyle,
                          ),
                        ),
                        Obx(() =>
                            Text('${_description[_currentIndex.toInt()]}')),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Obx(
                              () => DotsIndicator(
                                dotsCount: _lottieFiles.length,
                                position: _currentIndex.toDouble(),
                                decorator: DotsDecorator(),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                if (_currentIndex == _title.length - 1) {
                                  Get.toNamed(signup);
                                } else {
                                  _currentIndex + 1;
                                }
                              },
                              child: Container(
                                width: 37.w,
                                height: 37.h,
                                decoration: BoxDecoration(
                                    color: AppColor.scaffoldColor,
                                    shape: BoxShape.circle,
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.black26,
                                          offset: Offset(4.0, 4.0),
                                          blurRadius: 10,
                                          spreadRadius: 1.0),
                                      BoxShadow(
                                          color: Colors.white,
                                          offset: Offset(-4.0, -4.0),
                                          blurRadius: 5,
                                          spreadRadius: 1.0),
                                    ]),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
