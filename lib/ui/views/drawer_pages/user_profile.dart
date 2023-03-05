import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:toggle_switch/toggle_switch.dart';
import '../../styles/style.dart';
import '../../widgets/violet_btn.dart';

class UserProfileScreen extends StatelessWidget {
  // const UserFormScreen({super.key});

  TextEditingController _nameController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  Rx<TextEditingController> _dobController = TextEditingController().obs;

  Rx<DateTime> selectedDate = DateTime.now().obs;
  var gender = 'Male';

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

  setUserData(data, context) {
    _nameController.text = data['name'];
    _phoneController.text = data['phone'].toString();
    _addressController.text = data['address'];
    _dobController.value.text = data['dob'];
    gender = data['gender'];

    return Padding(
      padding: EdgeInsets.only(left: 30.w, right: 30.w, top: 40.h),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        SizedBox(
          height: 10.h,
        ),
        FormField(_nameController, TextInputType.name, 'Name'),
        FormField(_phoneController, TextInputType.phone, 'Number'),
        FormField(_addressController, TextInputType.text, 'Address'),
        Obx(
          () => TextFormField(
            controller: _dobController.value,
            readOnly: true,
            decoration: InputDecoration(
                hintText: "Date of birth",
                hintStyle:
                    TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w400),
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
          initialLabelIndex: gender == 'Male' ? 0 : 1,
          totalSwitches: 2,
          labels: ['Male', 'Female'],
          onToggle: (index) {
            if (index == 0) {
              gender = "Male";
            } else {
              gender = "Female";
            }
            print('switched to: $index');
          },
        ),
        SizedBox(
          height: 30.h,
        ),
        VioletBtn('Update', () {}),
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text("Profile"),
        ),
        body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('users-form-data')
              .doc(FirebaseAuth.instance.currentUser!.email)
              .snapshots(),
          builder: (context, snapshot) {
            var data = snapshot.data;
            if (!snapshot.hasData) {
              return Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return Center(child: CircularProgressIndicator());
            } else {
              return setUserData(data, context);
            }
          },
        ));
  }
}

Widget FormField(controller, type, hint) {
  return TextFormField(
      controller: controller,
      keyboardType: type,
      decoration: AppStyle.textFieldDecoration(hint));
}
