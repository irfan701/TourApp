import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:tour_app/ui/views/drawer_screen.dart';

import 'bottom_nav_controller/bottom_nav_controller.dart';

class MainHomeScreen extends StatelessWidget {
  const MainHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [DrawerScreen(), BottomNavController()],
    ));
  }
}
