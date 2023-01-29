import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tour_app/const/app_color.dart';
import 'package:tour_app/ui/route/route.dart';
import 'package:tour_app/ui/styles/style.dart';
import 'package:tour_app/ui/widgets/violet_btn.dart';

class SignUpScreen extends StatelessWidget {
  //const SignUpScreen({super.key});
  TextEditingController _email = TextEditingController();
  TextEditingController _pass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 30.w, right: 30.w, top: 80.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Create \nYour Account',
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 36.sp,
                    color: AppColor.violetColor),
              ),
              SizedBox(
                height: 12.h,
              ),
              Text(
                'Create your account and start your journey',
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 16.sp,
                ),
              ),
              SizedBox(
                height: 80.h,
              ),
              TextFormField(
                  controller: _email,
                  keyboardType: TextInputType.emailAddress,
                  decoration: AppStyle.textFieldDecoration('E-mail Address')),
              TextFormField(
                  controller: _email,
                  keyboardType: TextInputType.emailAddress,
                  decoration: AppStyle.textFieldDecoration('Enter Password')),
              SizedBox(
                height: 40.h,
              ),
              VioletBtn('Create Account'),
              SizedBox(
                height: 10.h,
              ),
              Center(
                child: Text(
                  '--OR--',
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 16.sp,
                  ),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: Image.asset('assets/icons/fb.png')),
                  IconButton(
                      onPressed: () {},
                      icon: Image.asset('assets/icons/google.png'))
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              RichText(
                  text: TextSpan(
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18.sp,
                          color: Colors.black),
                      text: "Already an user? ",
                      children: [
                    TextSpan(
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18.sp,
                            color: AppColor.violetColor),
                        text: "Log In",
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => Get.toNamed(signin)),
                  ]))
            ],
          ),
        ),
      ),
    );
  }
}
