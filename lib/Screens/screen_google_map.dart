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
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: controllerr.collegePatna,
          zoom: 20,
        ),
        markers: {
          Marker(
            markerId: const MarkerId("currentLocation"),
            icon: BitmapDescriptor.defaultMarker,
            position: controllerr.collegePatna,
          ),
          Marker(
            markerId: const MarkerId("destination"),
            icon: BitmapDescriptor.defaultMarker,
            position: controllerr.haroonColony,
          ),
        },
      ),
    );
  }
}
