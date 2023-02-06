import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 50.h, left: 30.w, right: 30.w),
        child: Column(
          children: [
            TextField(
              autofocus: true,
              decoration: InputDecoration(
                  hintText: 'Search for your next tour',
                  suffixIcon: IconButton(
                      onPressed: () {}, icon: Icon(Icons.search_off_outlined))),
            )
          ],
        ),
      ),
    );
  }
}
