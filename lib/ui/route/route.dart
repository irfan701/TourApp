import 'package:get/get.dart';
import 'package:tour_app/ui/views/onboarding_screen.dart';
import 'package:tour_app/ui/views/splash_screen.dart';

const splash = '/splash-screen';
const onboarding = '/onboarding-screen';

List<GetPage> getPages = [
  GetPage(name: splash, page: () => SplashScreen()),
  GetPage(name: onboarding, page: () => OnboardingScreen())
];
