import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:power_link_project/Controllers/controllers_home_page.dart';

class ScreenHomePage extends GetView<ScreenHomePage> {
  ScreenHomePage({super.key});
  static String pageId = "/ScreenHome";

  final controllerr = Get.put(ControllerHomePage());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Parking Space Availability'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Obx(() {
              if (controllerr.vacantSpaces.value == 0) {
                return const CircularProgressIndicator();
              } else {
                return Text(
                  'Vacant Spaces: ${controllerr.vacantSpaces.value}',
                  style: const TextStyle(fontSize: 24),
                );
              }
            }),
          ),
          ElevatedButton(
            onPressed: () => controllerr.fetchVacantSpaces(),
            child: const Text("Click to refresh data"),
          ),
        ],
      ),
    );
  }
}
