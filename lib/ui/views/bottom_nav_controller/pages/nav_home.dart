import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../route/route.dart';
import '../../../widgets/nav_home_categories_widget.dart';

class NavHome extends StatelessWidget {
  List listItems = [
    'assets/images/1.jpg',
    'assets/images/2.jpg',
    'assets/images/3.jpg',
    'assets/images/4.jpg',
    'assets/images/5.jpg',
    'assets/images/6.jpg',
  ];
  var _currentIndex = 0.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: 428.w,
              height: 152.h,
              // color: Colors.pink,
              child: CarouselSlider(
                options: CarouselOptions(
                  //  height: 300.h,
                  onPageChanged: ((index, reason) {
                    _currentIndex.value = index;
                  }),

                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 3),
                ),
                items: listItems.map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        // width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(i),
                            fit: BoxFit.cover,
                          ),
                        ),
                        //child:
                      );
                    },
                  );
                }).toList(),
              ),
            ),
            Obx(
              () => DotsIndicator(
                dotsCount: listItems.length,
                position: _currentIndex.value.toDouble(),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            //    Search(),
            SearchOne(),
            SizedBox(
              height: 5.h,
            ),
            navHomeCategoriesWd(
              "For You",
              () => Get.toNamed(seeAllScreen),
            ),

            SizedBox(
              height: 5.h,
            ),
            forYou(),
            SizedBox(
              height: 15.h,
            ),
            navHomeCategoriesWd(
              "Recently Added",
              () => Get.toNamed(seeAllScreen),
            ),
            SizedBox(
              height: 5.h,
            ),
            recentlyAdded(),
            SizedBox(
              height: 15.h,
            ),
            navHomeCategoriesWd(
              "Top Places",
              () => Get.toNamed(seeAllScreen),
            ),
            SizedBox(
              height: 5.h,
            ),
            topPlaces(),
            SizedBox(
              height: 50.h,
            ),
          ],
        ),
      ),
    );
  }
}

// Widget Slider(listItems, _currentIndex) {
//   return
// }

Widget Search() {
  return Container(
    width: 323.w,
    height: 50.h,
    decoration: BoxDecoration(
      //color: Colors.grey,
      borderRadius: BorderRadius.circular(7),
    ),
    child: TextFormField(
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.search),
        border: OutlineInputBorder(
            //  borderSide: BorderSide(color: Colors.greenAccent, width: 5.0),
            ),
        hintText: 'Search for you next tour',
      ),
    ),
  );
}

Widget SearchOne() {
  return Padding(
    padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 10.h, bottom: 10.h),
    child: InkWell(
      onTap: () => Get.toNamed(searchscreen),
      child: Container(
        height: 45.h,
        decoration: BoxDecoration(
          color: Colors.white38,
          borderRadius: BorderRadius.all(
            Radius.circular(6.r),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(left: 20.w),
          child: Row(
            children: [
              Icon(
                Icons.search_outlined,
                size: 20.w,
              ),
              SizedBox(
                width: 10.w,
              ),
              Text(
                "Search for your next tour",
                style: TextStyle(fontSize: 15.sp),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

Widget forYou() {
  return Container(
    height: 180.h,
    child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (_, index) {
          return Padding(
            padding: EdgeInsets.only(right: 12.w),
            child: InkWell(
              onTap: () => Get.toNamed(detailsScreen),
              child: Container(
                width: 100.w,
                height: 180.h,
                decoration: BoxDecoration(
                  color: Color(0xFfC4C4C4),
                  borderRadius: BorderRadius.all(
                    Radius.circular(7.r),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(7.r),
                          topRight: Radius.circular(7.r),
                        ),
                        child: Image.asset(
                          "assets/images/1.jpg",
                          height: 115.h,
                          fit: BoxFit.cover,
                        )),
                    Text(
                      "Title",
                      style: TextStyle(fontSize: 15.sp),
                    ),
                    Text(
                      "Cost",
                      style: TextStyle(
                          fontSize: 15.sp, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                  ],
                ),
              ),
            ),
          );
        }),
  );
}

Widget recentlyAdded() {
  return Container(
    height: 180.h,
    child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (_, index) {
          return Padding(
            padding: EdgeInsets.only(right: 12.w),
            child: Container(
              width: 100.w,
              height: 180.h,
              decoration: BoxDecoration(
                color: Color(0xFfC4C4C4),
                borderRadius: BorderRadius.all(
                  Radius.circular(7.r),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(7.r),
                        topRight: Radius.circular(7.r),
                      ),
                      child: Image.asset(
                        "assets/images/1.jpg",
                        height: 115.h,
                        fit: BoxFit.cover,
                      )),
                  Text(
                    "Title",
                    style: TextStyle(fontSize: 15.sp),
                  ),
                  Text(
                    "Cost",
                    style:
                        TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                ],
              ),
            ),
          );
        }),
  );
}

Widget topPlaces() {
  return Container(
    height: 80.h,
    child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (_, index) {
          return Padding(
            padding: EdgeInsets.only(right: 5.w),
            child: Container(
              width: 80.w,
              height: 80.h,
              decoration: BoxDecoration(
                  color: Color(0xFfC4C4C4),
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: AssetImage('assets/images/5.jpg'),
                      fit: BoxFit.cover)),
            ),
          );
        }),
  );
}
