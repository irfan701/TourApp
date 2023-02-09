import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tour_app/ui/widgets/support_field_widget.dart';

class Support extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Support"),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 20.h),
        child: Column(
          children: [
            Text(
              'If you have any problems , please contact us . We are at your service all the time.',
              style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w300),
            ),

            //   SizedBox(height: 20.h,),
            Divider(
              color: Colors.blue,
            ),
            supportField('Phone Number', '01991151076'),
            supportField('Email Address', 'skillstech@gmail.com'),
            supportField('Facebook', 'fb/afransarkar11')
          ],
        ),
      ),
    );
  }
}
