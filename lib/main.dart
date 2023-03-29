import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tour_app/const/app_string.dart';
import 'package:tour_app/controllers/app_languages.dart';
import 'package:tour_app/ui/route/route.dart';
import 'package:tour_app/ui/theme/app_theme.dart';
import 'package:tour_app/ui/views/splash_screen.dart';

import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
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
          translations: AppLanguages(),
          locale: Locale('bn', 'BD'),
          fallbackLocale: Locale('en', 'US'),
          theme: AppTheme().lightTheme(context),
          // darkTheme: AppTheme().darkTheme(context),
          themeMode: ThemeMode.system,
          initialRoute: splash,
          getPages: getPages,
          home: SplashScreen(),
        );
      },
    );
  }
}
