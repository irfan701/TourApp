import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tour_app/ui/route/route.dart';
import 'package:tour_app/ui/views/bottom_nav_controller/pages/nav_add_last_step.dart';
import 'package:tour_app/ui/widgets/custom_text_field.dart';
import 'package:tour_app/ui/widgets/violet_btn.dart';

class NavAdd extends StatelessWidget {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _desController = TextEditingController();
  TextEditingController _costController = TextEditingController();
  TextEditingController _facilityController = TextEditingController();
  TextEditingController _destinationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.only(left: 25.w, right: 25.w, top: 10.h),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                'Fill out the form and start the journey',
                style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w300),
              ),
              SizedBox(
                height: 20.h,
              ),
              customTextField("Owner Name", _nameController),
              customTextField("Description", _desController),
              customTextField("Cost", _costController),
              customTextField("Facilities", _facilityController, maxLine: 4),
              customTextField("Destination", _destinationController),
              SizedBox(
                height: 28.h,
              ),
              VioletBtn(
                  'Next',
                  () => Get.toNamed(navAddLastStep,
                      arguments: NavAddLastStep(
                          name: _nameController.text,
                          description: _desController.text,
                          cost: _costController.text,
                          facility: _facilityController.text,
                          destination: _destinationController.text)))
            ],
          ),
        ),
      ),
    );
  }
}
