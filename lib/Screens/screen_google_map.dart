import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:power_link_project/Controllers/controllers_google_map.dart';

class ScreenGoogleMapScreen extends GetView<ScreenGoogleMapScreen> {
  ScreenGoogleMapScreen({super.key});
  static String pageId = "/ScreenGoogleMap";

  final controllerr = Get.put(ControllersGoogleMapScreen());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => Stack(
          children: [
            GoogleMap(
              initialCameraPosition: CameraPosition(
                target: controllerr.chargingStation,
                zoom: 14,
              ),
              markers: controllerr.markers.toSet(),
              onMapCreated: (GoogleMapController controller) {},
            ),
            // Horizontal ListTiles at the bottom
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                color: Colors.white, // Background color of the tiles container
                height: 150, // Height of the tiles container
                child: ListView(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  scrollDirection: Axis.horizontal,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: ListTile(
                        title: const Text(
                          "Hello There",
                        ),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: ListTile(
                        title: Text("Another tile"),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
