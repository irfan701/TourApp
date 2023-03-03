import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tour_app/const/app_color.dart';
import 'package:tour_app/const/app_string.dart';
import 'package:tour_app/ui/route/route.dart';
import 'package:tour_app/ui/theme/app_theme.dart';
import 'package:tour_app/ui/views/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(428, 926),
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: AppString.appName,
          theme: AppTheme().lightTheme(context),
          darkTheme: AppTheme().darkTheme(context),
          //  themeMode: ThemeMode.system,
          initialRoute: splash,
          getPages: getPages,
          home: SplashScreen(),
        );
      },
    );
  }
}
