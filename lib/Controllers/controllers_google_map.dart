import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ControllersGoogleMapScreen extends GetxController {
  final LatLng chargingStation =
      const LatLng(25.609594144761225, 85.1408685649943);

  var markers = <Marker>{}.obs;

  @override
  void onInit() {
    super.onInit();
    loadNearbyChargingStations();
  }

  void loadNearbyChargingStations() {
    var locations = [
      {
        'id': '1',
        'name': 'Charge EV',
        'lat': 25.602617757025858,
        'lng': 85.13900841754068
      },
      {
        'id': '2',
        'name': 'Electric Vehicle Charging Station',
        'lat': 25.610231486865096,
        'lng': 85.13743763368815
      },
      {
        'id': '3',
        'name': 'Ather Grid Charging Station',
        'lat': 25.623813246108902,
        'lng': 85.1243386852289
      },
      {
        'id': '4',
        'name': 'Uznaka Charging Station',
        'lat': 25.60407921972789,
        'lng': 85.1374023175998
      }
    ];
    for (var location in locations) {
      final marker = Marker(
        markerId: MarkerId(location['id'] as String),
        position: LatLng(location['lat'] as double, location['lng'] as double),
        infoWindow: InfoWindow(title: location['name'] as String),
      );
      markers.add(marker);
    }
  }
}
