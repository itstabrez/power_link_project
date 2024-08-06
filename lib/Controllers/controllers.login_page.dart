import 'package:get/get.dart';

class ControllersLoginPage extends GetxController {
  var username = ''.obs;
  var password = ''.obs;

  bool get isValid => username.isNotEmpty && password.isNotEmpty;

  void setUsername(String value) {
    username.value = value;
  }

  void setPassword(String value) {
    password.value = value;
  }
}
