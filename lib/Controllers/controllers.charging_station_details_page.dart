import 'package:get/get.dart';
import 'package:power_link_project/api/things_speak_api.dart';

class ControllerChargingStationDetailsPage extends GetxController {
  var images = <String>[].obs;
  var stationName = ''.obs;
  var address = ''.obs;
  var openStatus = 'Open'.obs;
  var distance = 2.5.obs; // Default value
  var rating = 4.5.obs; // Default value
  var availablity = ''.obs;
  var amenities = <String>[].obs;
  var connectionTypes = <Map<String, dynamic>>[].obs;
  // API CALL
  var vacantSpaces = 3.obs;
  var total = 3;
  var field1Data = <int>[].obs;

  @override
  void onInit() {
    super.onInit();
    if (Get.arguments != null) {
      var arguments = Get.arguments as Map<String, dynamic>;
      images.value = arguments['images'] ?? [];
      stationName.value = arguments['stationName'] ?? '';
      address.value = arguments['address'] ?? '';
      distance.value = arguments['distance'] ?? '';
      rating.value = arguments['rating'] ?? '';
      availablity.value = arguments['availablity'] ?? '';
      amenities.value = arguments['amenities'] ?? [];
      connectionTypes.value = arguments['connectionTypes'] ?? [];
    }
    fetchVacantSpaces();
  }

  // API CALL
  final ThingSpeakService _thingSpeakService = ThingSpeakService();

  void fetchVacantSpaces() async {
    try {
      int spaces = await _thingSpeakService.getVacantSpaces();
      vacantSpaces.value = spaces;
    } catch (e) {
      vacantSpaces.value = 0;
      print('Error fetching data: $e');
    }
  }
}
