import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tour_app/controllers/nav_home.dart';
import 'package:tour_app/ui/views/bottom_nav_controller/pages/details_screen.dart';
import 'package:tour_app/ui/views/bottom_nav_controller/see_all.dart';
import '../../../route/route.dart';
import '../../../widgets/nav_home_categories_widget.dart';

class NavHome extends StatefulWidget {
  @override
  State<NavHome> createState() => _NavHomeState();
}

class _NavHomeState extends State<NavHome> {
  var _currentIndex = 0.obs;

  //carousel-Image
  List<String> _carouselImages = [];
  var _dotPosition = 0;
  fetchCarouselImages() async {
    QuerySnapshot qn =
        await FirebaseFirestore.instance.collection("carousel-image").get();
    setState(() {
      for (int i = 0; i < qn.docs.length; i++) {
        _carouselImages.add(
          qn.docs[i]["img"],
        );
        // print(qn.docs[i]["img"]);
      }
    });
    // return qn.docs;
  }

  //queryName
  late Future<QuerySnapshot> _futureDataForYou;
  late Future<QuerySnapshot> _futureDataRecentlyAdded;
  late Future<QuerySnapshot> _futureDataTopPlaces;

  @override
  void initState() {
    _futureDataForYou = NavHomeController().getData('for_you');
    _futureDataRecentlyAdded = NavHomeController().getData('recently_added');
    _futureDataTopPlaces = NavHomeController().getData('top_places');
    fetchCarouselImages();
    super.initState();
  }

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
                //  NavHomeController().fetchCarouselImages()[1]
                items: _carouselImages.map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        // width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(i),
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
                dotsCount:
                    _carouselImages.length == 0 ? 1 : _carouselImages.length,
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
              () =>
                  Get.toNamed(seeAllScreen, arguments: SeeAllScreen('for_you')),
            ),

            SizedBox(
              height: 5.h,
            ),

            Container(
                height: 180.h,
                child: FutureBuilder<QuerySnapshot>(
                    future: _futureDataForYou,
                    builder: (BuildContext context,
                        AsyncSnapshot<dynamic> snapshot) {
                      if (snapshot.hasError) {
                        return Text("Error");
                      }
                      if (snapshot.hasData) {
                        List<Map> items = parseData(snapshot.data);
                        return forYou(items);
                      }
                      return Center(child: CircularProgressIndicator());
                    })),

            SizedBox(
              height: 15.h,
            ),
            navHomeCategoriesWd(
              "Recently Added",
              () => Get.toNamed(
                seeAllScreen,
                arguments: SeeAllScreen('recently_added'),
              ),
            ),
            SizedBox(
              height: 5.h,
            ),
            Container(
                height: 180.h,
                child: FutureBuilder<QuerySnapshot>(
                    future: _futureDataRecentlyAdded,
                    builder: (BuildContext context,
                        AsyncSnapshot<dynamic> snapshot) {
                      if (snapshot.hasError) {
                        return Text("Error");
                      }
                      if (snapshot.hasData) {
                        List<Map> items = parseData(snapshot.data);
                        return recentlyAdded(items);
                      }
                      return Center(child: CircularProgressIndicator());
                    })),

            SizedBox(
              height: 15.h,
            ),
            navHomeCategoriesWd(
              "Top Places",
              () => Get.toNamed(seeAllScreen,
                  arguments: SeeAllScreen('top_places')),
            ),
            SizedBox(
              height: 5.h,
            ),

            Container(
                height: 80.h,
                child: FutureBuilder<QuerySnapshot>(
                    future: _futureDataTopPlaces,
                    builder: (BuildContext context,
                        AsyncSnapshot<dynamic> snapshot) {
                      if (snapshot.hasError) {
                        return Text("Error");
                      }
                      if (snapshot.hasData) {
                        List<Map> items = parseData(snapshot.data);
                        return topPlaces(items);
                      }
                      return Center(child: CircularProgressIndicator());
                    })),

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

List<Map> parseData(QuerySnapshot querySnapshot) {
  List<QueryDocumentSnapshot> listDocs = querySnapshot.docs;
  List<Map> listItems = listDocs
      .map((e) => {
            'list_images': e['gallery_image'],
            'list_destination': e['destination'],
            'list_cost': e['cost'],
            'list_description': e['description'],
            'list_facilities': e['facilities'],
            'list_owner_name': e['owner_name'],
            'list_phone': e['phone'],
          })
      .toList();
  return listItems;
}

Widget forYou(List<Map<dynamic, dynamic>> items) {
  return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: items.length,
      itemBuilder: (_, index) {
        Map thisItem = items[index];
        return Padding(
          padding: EdgeInsets.only(right: 12.w),
          child: InkWell(
            onTap: () =>
                Get.toNamed(detailsScreen, arguments: DetailsScreen(thisItem)),
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
                      child: Image.network(
                        thisItem['list_images'][0],
                        height: 115.h,
                        fit: BoxFit.cover,
                      )),
                  Text(
                    thisItem['list_destination'],
                    style: TextStyle(fontSize: 15.sp),
                  ),
                  Text(
                    thisItem['list_cost'],
                    style:
                        TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                ],
              ),
            ),
          ),
        );
      });
}

Widget recentlyAdded(List<Map<dynamic, dynamic>> items) {
  return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: items.length,
      itemBuilder: (_, index) {
        Map thisItem = items[index];
        return Padding(
          padding: EdgeInsets.only(right: 12.w),
          child: InkWell(
            onTap: () =>
                Get.toNamed(detailsScreen, arguments: DetailsScreen(thisItem)),
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
                      child: Image.network(
                        thisItem['list_images'][0],
                        height: 115.h,
                        fit: BoxFit.cover,
                      )),
                  Text(
                    thisItem['list_destination'],
                    style: TextStyle(fontSize: 15.sp),
                  ),
                  Text(
                    thisItem['list_cost'],
                    style:
                        TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                ],
              ),
            ),
          ),
        );
      });
}

Widget topPlaces(List<Map<dynamic, dynamic>> items) {
  return Container(
    height: 80.h,
    child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        itemBuilder: (_, index) {
          Map thisItem = items[index];
          return Padding(
            padding: EdgeInsets.only(right: 5.w),
            child: InkWell(
              onTap: () => Get.toNamed(detailsScreen,
                  arguments: DetailsScreen(thisItem)),
              child: Container(
                width: 80.w,
                height: 80.h,
                decoration: BoxDecoration(
                    color: Color(0xFfC4C4C4),
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: NetworkImage(thisItem['list_images'][0]),
                        fit: BoxFit.cover)),
              ),
            ),
          );
        }),
  );
}
