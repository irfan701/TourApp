import 'package:get/get.dart';
import 'package:tour_app/ui/views/auth/signin_screen.dart';
import 'package:tour_app/ui/views/auth/signup_screen.dart';
import 'package:tour_app/ui/views/onboarding_screen.dart';
import 'package:tour_app/ui/views/splash_screen.dart';

const splash = '/splash-screen';
const onboarding = '/onboarding-screen';
const signup = '/signup-screen';
const signin = '/signin-screen';

List<GetPage> getPages = [
  GetPage(name: splash, page: () => SplashScreen()),
  GetPage(name: onboarding, page: () => OnboardingScreen()),
  GetPage(name: signup, page: () => SignUpScreen()),
  GetPage(name: signin, page: () => SignInScreen())
];
