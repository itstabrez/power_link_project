import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:power_link_project/Controllers/controllers.charging_station_details_page.dart';

class ScreenChargingStationDetailsPage
    extends GetView<ControllerChargingStationDetailsPage> {
  final ControllerChargingStationDetailsPage controllerr =
      Get.put(ControllerChargingStationDetailsPage());
  static String pageId = "/ScreenChargingStationDetailsPage";

  ScreenChargingStationDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final arguments = Get.arguments as Map<String, dynamic>;
    final images = controllerr.images;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 4,
              child: CarouselSlider(
                options: CarouselOptions(
                  viewportFraction:
                      1.0, // Make sure only one image is visible at a time
                  autoPlay: true, // Optional: Enable automatic sliding
                  autoPlayInterval: const Duration(
                      seconds: 5), // Optional: Set auto play interval
                  // enlargeCenterPage: true,
                ),
                items: images.map((imageUrl) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Image.asset(
                        imageUrl,
                        fit: BoxFit.cover,
                        width: double.infinity,
                      );
                    },
                  );
                }).toList(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Obx(() => Text(
                        controllerr.stationName.value,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.access_time),
                      SizedBox(width: 4),
                      Text(controllerr.availablity.value),
                      SizedBox(width: 16),
                      Icon(Icons.location_on),
                      SizedBox(width: 4),
                      Obx(() => Text('${controllerr.distance.value} km')),
                      SizedBox(width: 16),
                      Icon(Icons.star),
                      SizedBox(width: 4),
                      Obx(() => Text('${controllerr.rating.value}')),
                    ],
                  ),
                  SizedBox(height: 8),
                  Obx(() => Text(controllerr.address.value)),
                  SizedBox(height: 16),
                  Text(
                    'Amenities',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Obx(() => Wrap(
                        spacing: 8,
                        children: controllerr.amenities
                            .map((amenity) => Chip(
                                  label: Text(amenity),
                                ))
                            .toList(),
                      )),
                  SizedBox(height: 16),
                  Text(
                    'Connection type',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Obx(() => Column(
                        children: controllerr.connectionTypes.map((connection) {
                          return Card(
                            child: ListTile(
                              title: Text(connection['type'] as String),
                              subtitle: Text(
                                  '${connection['power']}kw (\$${connection['price']}/kw)'),
                              trailing: Text(
                                '${connection['taken']}/${connection['total']} taken',
                                style: TextStyle(
                                  color: (connection['taken'] as int) <
                                          (connection['total'] as int)
                                      ? Colors.green
                                      : Colors.red,
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                      )),
                  SizedBox(height: 16),
                  Text(
                    'Review',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Obx(() => LinearProgressIndicator(
                        value: controllerr.rating.value / 5,
                        minHeight: 20,
                        backgroundColor: Colors.grey[300],
                        color: Colors.blue,
                      )),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            // Handle Book slot action
                          },
                          child: Text('Book slot'),
                        ),
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            // Handle Get direction action
                          },
                          child: Text('Get direction'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
