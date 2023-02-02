import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../const/app_string.dart';

class BottomNavController extends StatelessWidget {
  //const BottomNavController({super.key});

  var _currentIndex = 0.obs;
  var _drawer = false.obs;
  var _pages = [
    Container(
      color: Colors.black,
    ),
    Container(
      color: Colors.green,
    ),
    Container(
      color: Colors.pink,
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(() => AnimatedPositioned(
          duration: Duration(milliseconds: 400),
          top: _drawer.value == false ? 0 : 100.h,
          bottom: _drawer.value == false ? 0 : 100.h,
          left: _drawer.value == false ? 0 : 200.w,
          right: _drawer.value == false ? 0 : -150.w,
          child: Container(
            decoration: BoxDecoration(),
            child: Scaffold(
              appBar: AppBar(
                title: Text(
                  AppString.appName,
                  style: TextStyle(color: Colors.black),
                ),
                leading: _drawer.value == false
                    ? IconButton(
                        onPressed: () => _drawer.value = true,
                        icon: Icon(
                          Icons.menu,
                          color: Colors.black,
                        ))
                    : IconButton(
                        onPressed: () => _drawer.value = false,
                        icon: Icon(
                          Icons.close,
                          color: Colors.black,
                        )),
                backgroundColor: Colors.white,
                elevation: 0,
              ),
              bottomNavigationBar: BottomNavigationBar(
                currentIndex: _currentIndex.value,
                onTap: (value) => _currentIndex.value = value,
                items: [
                  BottomNavigationBarItem(
                      icon: Icon(Icons.home_outlined), label: 'Home'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.add_outlined), label: 'Add'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.favorite_outline), label: 'Favourite')
                ],
              ),
              body: _pages[_currentIndex.value],
            ),
          ),
        ));
  }
}
