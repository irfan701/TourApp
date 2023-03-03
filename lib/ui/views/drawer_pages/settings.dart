import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tour_app/ui/theme/app_theme.dart';
import 'package:tour_app/ui/widgets/drawer_item_widget.dart';

import '../../route/route.dart';

class Settings extends StatelessWidget {
  RxBool darkMode = false.obs;

  Future logout(context) async {
    return showDialog(
        context: context,
        builder: (_) => AlertDialog(
              title: Text("are u sure to logout?"),
              content: Row(
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: Text("Yes"),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text("No"),
                  ),
                ],
              ),
            ));
  }

  Future changeLanguage(context) async {
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text("Select your language!"),
              content: Container(
                height: 200.h,
                child: Column(
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: Text("Bangla"),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text("English"),
                    ),
                  ],
                ),
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //  backgroundColor: Colors.white,
        elevation: 0,
        title: Text("Settings"),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 25.w, right: 25.w, top: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Dark Mode',
                  style:
                      TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w400),
                ),
                Obx(() => Switch(
                      value: darkMode.value,
                      onChanged: (bool value) {
                        darkMode.value = value;
                        Get.changeTheme(darkMode.value == false
                            ? AppTheme().lightTheme(context)
                            : AppTheme().darkTheme(context));
                      },
                    ))
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            drawerItemWd(
              "Logout",
              () => logout(context),
            ),
            drawerItemWd(
              "Profile",
              () => Get.toNamed(profileScreen),
            ),
            drawerItemWd(
              "Languages",
              () => changeLanguage(context),
            ),
            Container(
              width: 300,
              height: 100,
              color: Get.isDarkMode == false ? Colors.yellow : Colors.green,
            )
          ],
        ),
      ),
    );
  }
}
