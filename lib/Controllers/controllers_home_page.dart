import 'package:get/get.dart';
import 'package:power_link_project/api/things_speak_api.dart';

class ControllerHomePage extends GetxController {
  var vacantSpaces = 0.obs;
  var field1Data = <int>[].obs;

  final ThingSpeakService _thingSpeakService = ThingSpeakService();

  @override
  void onInit() {
    super.onInit();
    fetchVacantSpaces();
    // fetchField1Data();
  }

  void fetchVacantSpaces() async {
    try {
      int spaces = await _thingSpeakService.getVacantSpaces();
      vacantSpaces.value = spaces;
    } catch (e) {
      print('Error fetching data: $e');
    }
  }

  // void fetchField1Data() async {
  //   try {
  //     List<int> data = await _thingSpeakService.getField1Data();
  //     field1Data.value = data;
  //   } catch (e) {
  //     print('Error fetching data: $e');
  //   }
  // }
}
