import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:tour_app/ui/route/route.dart';

import '../../../const/app_color.dart';
import '../../styles/style.dart';
import '../../widgets/violet_btn.dart';

class UserProfileScreen extends StatelessWidget {
  // const UserFormScreen({super.key});

  TextEditingController _nameController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  Rx<TextEditingController> _dobController = TextEditingController().obs;

  Rx<DateTime> selectedDate = DateTime.now().obs;

  selecDate(BuildContext context) async {
    final selected = await showDatePicker(
        context: context,
        initialDate: selectedDate.value,
        firstDate: DateTime(2000),
        lastDate: DateTime(2030));

    if (selected != null && selected != selectedDate) {
      _dobController.value.text =
          "${selected.day}-${selected.month}-${selected.year}";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text("Profile"),
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(left: 30.w, right: 30.w, top: 40.h),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              SizedBox(
                height: 10.h,
              ),
              FormField(_nameController, TextInputType.emailAddress, 'Name'),
              FormField(_phoneController, TextInputType.emailAddress, 'Number'),
              FormField(
                  _addressController, TextInputType.emailAddress, 'Address'),
              Obx(
                () => TextFormField(
                  controller: _dobController.value,
                  readOnly: true,
                  decoration: InputDecoration(
                      hintText: "Date of birth",
                      hintStyle: TextStyle(
                          fontSize: 16.sp, fontWeight: FontWeight.w400),
                      suffixIcon: IconButton(
                        onPressed: () => selecDate(context),
                        icon: Icon(Icons.calendar_month),
                      )),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              ToggleSwitch(
                initialLabelIndex: 0,
                totalSwitches: 2,
                labels: ['Male', 'Female'],
                onToggle: (index) {
                  print('switched to: $index');
                },
              ),
              SizedBox(
                height: 30.h,
              ),
              VioletBtn('Update', () {}),
            ]),
          ),
        ));
  }
}

Widget FormField(controller, type, hint) {
  return TextFormField(
      controller: controller,
      keyboardType: type,
      decoration: AppStyle.textFieldDecoration(hint));
}
