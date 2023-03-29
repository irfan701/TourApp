import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tour_app/controllers/see_all_controller.dart';
import 'package:tour_app/ui/views/bottom_nav_controller/pages/details_screen.dart';

class SeeAllScreen extends StatefulWidget {
  var compare;
  SeeAllScreen(this.compare);

  @override
  State<SeeAllScreen> createState() => _SeeAllScreenState();
}

class _SeeAllScreenState extends State<SeeAllScreen> {
  //queryName
  late Future<QuerySnapshot> _futureDataForYou;
  @override
  void initState() {
    _futureDataForYou = SeeAllController().getData(widget.compare);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          iconTheme: IconThemeData(
            color: Colors.black, // <-- SEE HERE
          ),
          title: Text(
            "See All",
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: FutureBuilder<QuerySnapshot>(
            future: _futureDataForYou,
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              if (snapshot.hasError) {
                return Text("Error");
              }
              if (snapshot.hasData) {
                List<Map> items = parseData(snapshot.data);
                return forYouBuildGridview(items);
              }
              return Center(child: CircularProgressIndicator());
            }));
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

  forYouBuildGridview(List<Map<dynamic, dynamic>> shoppingItems) {
    return Padding(
      padding: EdgeInsets.only(left: 10.w, right: 10.w, top: 20.h),
      child: GridView.builder(
          itemCount: shoppingItems.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            // childAspectRatio: 0.7,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
          ),
          itemBuilder: ((context, index) {
            Map thisItem = shoppingItems[index];
            return InkWell(
              onTap: () => Get.to(DetailsScreen(thisItem)),
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xFfC4C4C4),
                  borderRadius: BorderRadius.circular(7.r),
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
                          // height: 115.h,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        )),
                    Text(
                      thisItem['list_destination'],
                      style: TextStyle(fontSize: 15.sp),
                    ),
                    Text(
                      thisItem['list_cost'],
                      style: TextStyle(
                          fontSize: 15.sp, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                  ],
                ),
              ),
            );
          })),
    );
  }
}
