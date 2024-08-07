import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class ControllersGoogleMapScreen extends GetxController {
  final LatLng defaultChargingStation =
      const LatLng(25.609594144761225, 85.1408685649943);

  var isLoading = false.obs;
  final username = "Tabrez Alam";

  var markers = <Marker>{}.obs;

  late GoogleMapController mapController;
  LatLng? currentLocation;

  @override
  void onInit() {
    super.onInit();
    loadNearbyChargingStations();
    // getCurrentLocation();
  }

  final List<Map<String, dynamic>> locations = [
    {
      'images': [
        'assets/images/chargehub/1.jpg',
        'assets/images/chargehub/s1.jpg'
      ],
      'id': '1',
      'name': 'Charge Hub',
      'lat': 25.602617757025858,
      'lng': 85.13900841754068,
      'address': "Mithapur Farm Area, Mithapur, Bihar 800001",
      'availablity': "24*7",
      "distance": 2.5,
      'rating': 4.2,
      'amenities': ['Store', 'Park', 'Toilet', 'Food'],
      'connectionTypes': [
        {
          'type': 'Mennekers',
          'power': 22,
          'price': 5,
        },
      ],
    },
    {
      'images': [
        'assets/images/evcharging/5.jpg',
        'assets/images/evcharging/s2.jpg'
      ],
      'id': '2',
      'name': 'EV Chargng Station',
      'lat': 25.610231486865096,
      'lng': 85.13743763368815,
      'address': "Bander Bagicha, Chowk, Patna, Bihar 800001",
      'availablity': "24*7",
      "distance": 1.5,
      'rating': 2.2,
      'amenities': ['Cafe', 'Store', 'Park', 'Toilet'],
      'connectionTypes': [
        {
          'type': 'Mennekers',
          'power': 22,
          'price': 5,
        },
      ],
    },
    {
      'images': [
        'assets/images/athergrid/3.jpg',
        'assets/images/athergrid/s1.png'
      ],
      'id': '3',
      'name': 'Ather Grid Station',
      'lat': 25.623813246108902,
      'lng': 85.1243386852289,
      'address': "Rajapur, Buddha Colony, Patna, Bihar 800001",
      'availablity': "24*7",
      'distance': 4.8,
      'rating': 4.3,
      'amenities': ['Cafe', 'Park', 'Toilet', 'Food'],
      'connectionTypes': [
        {
          'type': 'Mennekers',
          'power': 22,
          'price': 5,
        },
      ],
    },
    {
      'images': ['assets/images/uznaka/4.png', 'assets/images/uznaka/s1.jpeg'],
      'id': '4',
      'name': 'Uznaka Charging Station',
      'lat': 25.60407921972789,
      'lng': 85.1374023175998,
      'address': "Budh Vihar, Fraser Road Area, Patna, Bihar 800001",
      'availablity': "24*7",
      "distance": 2.2,
      'rating': 4.4,
      'amenities': ['Cafe', 'Store', 'Toilet', 'Food'],
      'connectionTypes': [
        {
          'type': 'Mennekers',
          'power': 22,
          'price': 5,
        },
      ],
    },
    {
      'images': [
        'assets/images/macet/2.jpg',
        'assets/images/macet/s1.jpg',
        'assets/images/macet/s2.jpg',
        'assets/images/macet/s3.jpg'
      ],
      'id': '5',
      'name': 'PowerLink Station',
      'lat': 25.58737801383396,
      'lng': 84.9821448532907,
      'address': "Macet College Neoraganj, Bihar 800001",
      'availablity': "24*7",
      "distance": 2.5,
      'rating': 4.2,
      'amenities': ['Cafe', 'Store', 'Park', 'Toilet', 'Food'],
      'connectionTypes': [
        {
          'type': 'Mennekers',
          'power': 22,
          'price': 5,
        },
      ],
    },
  ];

  void loadNearbyChargingStations() {
    for (var location in locations) {
      final marker = Marker(
        markerId: MarkerId(location['id'] as String),
        position: LatLng(location['lat'] as double, location['lng'] as double),
        infoWindow: InfoWindow(title: location['name'] as String),
      );
      markers.add(marker);
    }
  }

  void moveToLocation(double lat, double lng) {
    mapController.animateCamera(
      CameraUpdate.newLatLng(
        LatLng(lat, lng),
      ),
    );
  }

  void onMapCreated(GoogleMapController controller) {
    mapController = controller;
    if (currentLocation != null) {
      moveToLocation(currentLocation!.latitude, currentLocation!.longitude);
    }
  }

  void getCurrentLocation() async {
    final location = Location();
    try {
      final currentLocationData = await location.getLocation();
      currentLocation =
          LatLng(currentLocationData.latitude!, currentLocationData.longitude!);
      update(); // Notify listeners
    } catch (e) {
      print('Could not get current location: $e');
      currentLocation = defaultChargingStation; // Fallback to default
    }
  }
}
