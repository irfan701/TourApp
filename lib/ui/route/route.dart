import 'package:get/get.dart';
import 'package:tour_app/ui/views/auth/signin_screen.dart';
import 'package:tour_app/ui/views/auth/signup_screen.dart';
import 'package:tour_app/ui/views/bottom_nav_controller/pages/nav_add_last_step.dart';
import 'package:tour_app/ui/views/bottom_nav_controller/search_screen.dart';
import 'package:tour_app/ui/views/drawer_pages/faq.dart';
import 'package:tour_app/ui/views/drawer_pages/how_to_use.dart';
import 'package:tour_app/ui/views/drawer_pages/privacy.dart';
import 'package:tour_app/ui/views/drawer_pages/settings.dart';
import 'package:tour_app/ui/views/drawer_pages/support.dart';
import 'package:tour_app/ui/views/main_home_screen.dart';
import 'package:tour_app/ui/views/onboarding_screen.dart';
import 'package:tour_app/ui/views/privacy_policy_screen.dart';
import 'package:tour_app/ui/views/splash_screen.dart';
import 'package:tour_app/ui/views/user_form_screen.dart';

import '../views/bottom_nav_controller/see_all.dart';

const splash = '/splash-screen';
const onboarding = '/onboarding-screen';
const signup = '/signup-screen';
const signin = '/signin-screen';
const userForm = '/userform-screen';
const privacyPolicy = '/privacy-policy-screen';
const mainHome = '/main-home-screen';

const faq = '/faq-screen';
const support = '/support-screen';
const privacy = '/privacy-screen';
const setting = '/setting-screen';
const howtouse = '/how-to-use-screen';
const searchscreen = '/search-screen';
const seeAllScreen = '/see-all-screen';
const navAddLastStep = '/navAddLastStep-screen';

List<GetPage> getPages = [
  GetPage(name: splash, page: () => SplashScreen()),
  GetPage(name: onboarding, page: () => OnboardingScreen()),
  GetPage(name: signup, page: () => SignUpScreen()),
  GetPage(name: signin, page: () => SignInScreen()),
  GetPage(name: userForm, page: () => UserFormScreen()),
  GetPage(name: privacyPolicy, page: () => PrivacyPolicyScreen()),
  GetPage(name: mainHome, page: () => MainHomeScreen()),
  GetPage(name: faq, page: () => Faq()),
  GetPage(name: support, page: () => Support()),
  GetPage(name: privacy, page: () => Privacy()),
  GetPage(name: setting, page: () => Settings()),
  GetPage(name: howtouse, page: () => HowToUse()),
  GetPage(name: searchscreen, page: () => SearchScreen()),
  GetPage(name: seeAllScreen, page: () => SeeAllScreen()),
  GetPage(name: navAddLastStep, page: () => NavAddLastStep()),
];
