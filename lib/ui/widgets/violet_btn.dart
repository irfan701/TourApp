import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tour_app/const/app_color.dart';

class VioletBtn extends StatelessWidget {
  String title;
  Function onAction;
  VioletBtn(this.title, this.onAction);

  var _value = false.obs;

  @override
  Widget build(BuildContext context) {
    return Obx(() => InkWell(
          onTap: () {
            _value.value = true;
            onAction();
          },
          child: Container(
              height: 48.h,
              width: double.maxFinite,
              decoration: BoxDecoration(
                  color: AppColor.violetColor,
                  borderRadius: BorderRadius.circular(5.r)),
              child: _value == false
                  ? Center(
                      child: Text(
                        title,
                        style: TextStyle(
                            fontSize: 17.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'pls wait',
                          style: TextStyle(
                              fontSize: 17.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Transform.scale(
                            scale: 0.4,
                            child: CircularProgressIndicator(
                              color: Colors.white,
                            ))
                      ],
                    )),
        ));
  }
}
