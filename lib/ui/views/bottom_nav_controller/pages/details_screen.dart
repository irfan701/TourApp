import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../widgets/details_heading_description.dart';

class DetailsScreen extends StatelessWidget {
  // const DetailsScreen({super.key});

  String description =
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.";
  String facilities =
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.";
  String destination =
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry.";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //   backgroundColor: Colors.white,
        elevation: 0,
        title: Text("Details"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.favorite_outline),
          ),
          //  ElevatedButton(onPressed: () {}, child: Icon(Icons.favorite_outline))
        ],
      ),
      body: Column(
        children: [
          Expanded(
              flex: 7,
              child: Column(
                children: [
                  Slider(),
                  SizedBox(
                    height: 34.h,
                  ),
                  detailsHeadingDescription("Description", description),
                  detailsHeadingDescription("Facilities", facilities),
                  detailsHeadingDescription("Destination", destination),
                  detailsHeadingDescription("Journey Date & Time", destination),
                  detailsHeadingDescription("Cost", "3000 Taka"),
                ],
              )),

          Expanded(
            flex: 1,
            child: Container(
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "Owner Name",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 14.sp,
                    ),
                  ),
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {}, icon: Icon(Icons.call_outlined)),
                      IconButton(
                          onPressed: () {}, icon: Icon(Icons.message_outlined)),
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
