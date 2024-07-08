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
                margin:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                color: Colors.white, // Background color of the tiles container
                height: 150, // Height of the tiles container
                child: PageView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Container(
                      padding: EdgeInsets.all(8),
                      child: ListTile(
                        title: Text(
                          "Electric Vehicle Charging Station 1",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text("Location 1"),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(8),
                      child: ListTile(
                        title: Text(
                          "Electric Vehicle Charging Station 2",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text("Location 2"),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(8),
                      child: ListTile(
                        title: Text(
                          "Electric Vehicle Charging Station 3",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text("Location 3"),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(8),
                      child: ListTile(
                        title: Text(
                          "Electric Vehicle Charging Station 4",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text("Location 4"),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(8),
                      child: ListTile(
                        title: Text(
                          "Electric Vehicle Charging Station 5",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text("Location 5"),
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
