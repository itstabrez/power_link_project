import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:power_link_project/Controllers/controllers_google_map.dart';
import 'package:power_link_project/Screens/screen_charging_station_details_page.dart';
import 'package:power_link_project/Screens/screen_slot_booking.dart';

class BottomListTiles extends GetView<BottomListTiles> {
  BottomListTiles({super.key});

  final controllerr = Get.put(ControllersGoogleMapScreen());

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      options: CarouselOptions(
        viewportFraction: 1,
        initialPage: 0,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 5),
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        autoPlayCurve: Curves.easeOutSine,
        scrollDirection: Axis.horizontal,
      ),
      itemCount: controllerr.locations.length,
      itemBuilder: (context, index, realIndex) {
        return GestureDetector(
          onTap: () {
            // Handle tap event
          },
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 25),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black,
                  blurRadius: 5,
                  spreadRadius: 1,
                ),
              ],
              color: Colors.white,
            ),
            child: Row(
              children: [
                // Image shown in tiles
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    controllerr.images[index],
                    fit: BoxFit.cover,
                    width: 130,
                    height: 150,
                  ),
                ),
                Expanded(
                  // Name of charging stations
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        title: Text(
                          controllerr.locations[index]["name"],
                          style: const TextStyle(fontWeight: FontWeight.bold),
                          maxLines: 1,
                        ),
                        subtitle: Text(
                          controllerr.locations[index]["address"],
                          style: const TextStyle(
                            fontWeight: FontWeight.w400,
                          ),
                          maxLines: 2,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            children: [
                              const Icon(
                                Icons.access_time,
                                size: 18,
                              ),
                              Text(
                                controllerr.locations[index]["availablity"],
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.location_pin,
                                size: 18,
                              ),
                              Text(
                                '${controllerr.locations[index]["distance"].toString()} km',
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.star,
                                size: 18,
                              ),
                              Text(
                                controllerr.locations[index]["rating"]
                                    .toString(),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          // Get Direction Button
                          AnimatedSwitcher(
                            duration: const Duration(milliseconds: 200),
                            child: controllerr.isLoading.value
                                ? const CircularProgressIndicator()
                                : ElevatedButton(
                                    onPressed: () {
                                      controllerr.moveToLocation(
                                        controllerr.locations[index]['lat'],
                                        controllerr.locations[index]['lng'],
                                      );
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor:
                                          Colors.red, // Background color
                                      foregroundColor:
                                          Colors.white, // Text color
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 10,
                                        vertical: 10,
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                            10), // Rounded corners
                                      ),
                                    ),
                                    child: const Text(
                                      'Get Direction',
                                      style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                          ),
                          // Slot Booking Button
                          ElevatedButton(
                            onPressed: () => Get.toNamed(
                              ScreenChargingStationDetailsPage.pageId,
                              arguments: {
                                'images': [
                                  controllerr.images[index],
                                  controllerr.images[index],
                                ],
                                'stationName': controllerr.locations[index]
                                    ["name"],
                                'address': controllerr.locations[index]
                                    ["address"],
                                'rating': controllerr.locations[index]
                                    ["rating"],
                                'distance': controllerr.locations[index]
                                    ["distance"],
                                'availablity': controllerr.locations[index]
                                    ["availablity"],
                                'amenities': [
                                  'Cafe',
                                  'Store',
                                  'Park',
                                  'Toilet',
                                  'Food'
                                ],
                                'connectionTypes': [
                                  {
                                    'type': 'CCS2',
                                    'power': 150,
                                    'price': 0.05,
                                    'taken': 0,
                                    'total': 2,
                                  },
                                  {
                                    'type': 'CCS',
                                    'power': 120,
                                    'price': 0.05,
                                    'taken': 3,
                                    'total': 3,
                                  },
                                  {
                                    'type': 'Mennekers',
                                    'power': 22,
                                    'price': 0.02,
                                    'taken': 0,
                                    'total': 2,
                                  },
                                ],
                              },
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green, // Background color
                              foregroundColor: Colors.white, // Text color
                              padding: const EdgeInsets.symmetric(
                                horizontal: 15,
                                vertical: 10,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    10), // Rounded corners
                              ),
                            ),
                            child: const Text(
                              'Book Slot',
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
