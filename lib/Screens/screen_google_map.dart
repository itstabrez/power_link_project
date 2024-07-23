import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:power_link_project/Controllers/controllers_google_map.dart';
import 'package:power_link_project/widgets/bottom_list_tiles.dart';
import 'package:power_link_project/widgets/my_drawer.dart';

class ScreenGoogleMapScreen extends GetView<ScreenGoogleMapScreen> {
  ScreenGoogleMapScreen({super.key});
  static String pageId = "/ScreenGoogleMap";

  final controllerr = Get.put(ControllersGoogleMapScreen());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text("PowerLink"),
        backgroundColor: Colors.transparent,
      ),
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
              child: Obx(
                () => controllerr.isBottomTileLoading.value
                    ? const Center(child: CircularProgressIndicator.adaptive())
                    : BottomListTiles(),
              ),
            ),
          ],
        ),
      ),
      drawer: MyDrawerScreen(),
    );
  }
}
