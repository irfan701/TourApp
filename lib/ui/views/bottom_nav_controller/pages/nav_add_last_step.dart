import 'dart:io';

import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tour_app/ui/widgets/custom_text_field.dart';
import 'package:tour_app/ui/widgets/violet_btn.dart';

class NavAddLastStep extends StatefulWidget {
  var name;
  var description;
  var cost;
  var facility;
  var destination;

  NavAddLastStep(
      {required this.name,
      required this.description,
      required this.cost,
      required this.facility,
      required this.destination});

  @override
  State<NavAddLastStep> createState() => _NavAddLastStepState();
}

class _NavAddLastStepState extends State<NavAddLastStep> {
  TextEditingController _phoneController = TextEditingController();

  TextEditingController _dateTimeController = TextEditingController();

  final ImagePicker _picker = ImagePicker();

  // Pick an image
  List<XFile>? multipleImages;

  List<String> imageUrls = [];

  Future multipleImagePicker() async {
    multipleImages = await _picker.pickMultiImage();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    print(widget.name);
    print(widget.description);
    print(widget.cost);
    print(widget.facility);
    print(widget.destination);
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(left: 25.w, right: 25.w, top: 60.h),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  customTextField("Phone Number", _phoneController),
                  customTextField(
                      "Destination Date & Time", _dateTimeController),
                  Text(
                    "Choose Images",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18.sp,
                    ),
                  ),
                  Container(
                    height: 100.h,
                    decoration: BoxDecoration(
                      color: Color(0xFFE9EBED),
                      borderRadius: BorderRadius.circular(7.r),
                    ),
                    child: Center(
                      child: FloatingActionButton(
                        onPressed: () {
                          multipleImagePicker();
                        },
                        child: const Icon(Icons.add),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Container(
                    height: 150,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: multipleImages?.length ?? 0,
                      itemBuilder: (_, index) {
                        return Padding(
                          padding: EdgeInsets.only(right: 10.w),
                          child: Container(
                            width: 100,
                            child: multipleImages?.length == null
                                ? const Center(
                                    child: Text("Images are empty"),
                                  )
                                : Image.file(
                                    File(multipleImages![index].path),
                                    fit: BoxFit.cover,
                                  ),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 50.h,
                  ),
                  VioletBtn(
                    "Upload",
                    () {},
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
