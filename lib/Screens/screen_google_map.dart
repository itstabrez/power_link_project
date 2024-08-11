import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:power_link_project/Controllers/controllers.login_page.dart';
import 'package:power_link_project/Controllers/controllers_google_map.dart';
import 'package:power_link_project/Screens/notification_page.dart';
import 'package:power_link_project/widgets/bottom_list_tiles.dart';
import 'package:power_link_project/widgets/my_drawer.dart';

class ScreenGoogleMapScreen extends GetView<ScreenGoogleMapScreen> {
  ScreenGoogleMapScreen({super.key});
  static String pageId = "/ScreenGoogleMap";

  final controllerr = Get.put(ControllersGoogleMapScreen());
  final userController = Get.find<ControllersLoginPage>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70.0), // here the desired height
        child: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: false,
          title: Column(
            children: [
              Row(
                children: [
                  const CircleAvatar(
                    backgroundImage:
                        NetworkImage("https://i.pravatar.cc/150?img=3"),
                    minRadius: 30,
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Welcome, ${userController.username.value}',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Text(
                          'Find your nearest charging point',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Color.fromARGB(255, 121, 121, 121),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          actions: [
            IconButton(
              onPressed: () {
                Get.to(() => ScreenNotificationPage());
              },
              icon: const Icon(Icons.notifications, color: Colors.blue),
            ),
            IconButton(
                onPressed: () {
                  Get.dialog(MyDrawerScreen());
                },
                icon: const Icon(Icons.add)),
          ],
          backgroundColor: Colors.transparent,
          //   elevation: 0,
          flexibleSpace: Container(
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 200, 231, 255)
                  .withOpacity(0.7), // Black color with 50% opacity
            ),
          ),
        ),
      ),
      body: Obx(
        () => Stack(
          children: [
            GoogleMap(
              initialCameraPosition: CameraPosition(
                target: controllerr.defaultChargingStation,
                zoom: 16,
              ),
              markers: controllerr.markers.toSet(),
              onMapCreated: controllerr.onMapCreated,
            ),
            // Horizontal ListTiles at the bottom
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: BottomListTiles(),
            ),
          ],
        ),
      ),
    );
  }
}
