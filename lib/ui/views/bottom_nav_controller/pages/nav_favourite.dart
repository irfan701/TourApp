import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NavFavourite extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: 20,
        itemBuilder: ((context, index) {
          return Card(
            elevation: 5,
            child: Stack(
              children: [
                Container(
                  height: 200.h,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/6.jpg"),
                        fit: BoxFit.cover),
                  ),
                ),

                // Image.asset(
                //   'assets/images/6.jpg',
                //   // height: 200.h,
                // ),
                Positioned(
                    right: 0,
                    child: CircleAvatar(
                      //radius: 25.r,
                      backgroundColor: Colors.white,
                      child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.delete_forever,
                            color: Colors.red,
                          )),
                    )),
              ],
            ),
          );
        }),
      ),
    );
  }
}
