import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:power_link_project/Screens/screen_google_map.dart';
import 'package:power_link_project/utlities/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "PowerLink",
      debugShowCheckedModeBanner: false,
      home: ScreenGoogleMapScreen(),
      getPages: AppPages.pages,
    );
  }
}
