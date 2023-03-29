import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tour_app/controllers/details_controller.dart';
import 'package:tour_app/controllers/toast.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../widgets/details_heading_description.dart';

class DetailsScreen extends StatefulWidget {
  Map detailsData;
  DetailsScreen(this.detailsData);

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  //add to favourite
  addtoFavourite() async {
    DetailsController().addToFavourite(
        widget.detailsData['list_images'][0],
        widget.detailsData['list_destination'],
        widget.detailsData['list_cost']);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //   backgroundColor: Colors.white,
        elevation: 0,
        title: Text("Details"),
        actions: [
          StreamBuilder<QuerySnapshot>(
              stream: DetailsController()
                  .getData(widget.detailsData['list_images'][0]),
              builder: (BuildContext context, snapshot) {
                if (snapshot.data == null) return Text("");
                return IconButton(
                  icon: snapshot.data!.docs.length == 0
                      ? Icon(
                          Icons.favorite_outline,
                        )
                      : Icon(
                          Icons.favorite,
                          color: Colors.red,
                        ),
                  onPressed: () {
                    snapshot.data!.docs.length == 0
                        ? addtoFavourite()
                        : Toastify().error("Already Added");
                  },
                );
              }),
        ],
      ),
      body: Column(
        children: [
          Expanded(
              flex: 7,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Slider(),
                    SizedBox(
                      height: 34.h,
                    ),
                    AspectRatio(
                        aspectRatio: 3,
                        child: Image.network(
                          widget.detailsData['list_images'][0],
                          fit: BoxFit.cover,
                        )),
                    detailsHeadingDescription(
                        "Description", widget.detailsData['list_description']),
                    detailsHeadingDescription(
                        "Facilities", widget.detailsData['list_facilities']),
                    detailsHeadingDescription(
                        "Destination", widget.detailsData['list_destination']),
                    detailsHeadingDescription("Journey Date & Time",
                        widget.detailsData['list_destination']),
                    detailsHeadingDescription(
                        "Cost", widget.detailsData['list_cost']),
                  ],
                ),
              )),

          Expanded(
            flex: 1,
            child: Container(
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    widget.detailsData['list_owner_name'],
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 14.sp,
                    ),
                  ),
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            launchUrl(Uri.parse(
                                "tel:${widget.detailsData['list_phone']}"));
                          },
                          icon: Icon(Icons.call_outlined)),
                      IconButton(
                          onPressed: () {
                            launchUrl(Uri.parse(
                                "sms:${widget.detailsData['list_phone']}"));
                          },
                          icon: Icon(Icons.message_outlined)),
                    ],
                  )
                ],
              ),
            ),
          ),

          //   Slider(),
          // SizedBox(),
        ],
      ),
    );
  }
}

Widget Slider() {
  return Container();
}
