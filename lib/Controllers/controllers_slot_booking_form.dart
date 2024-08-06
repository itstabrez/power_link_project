import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ControllersSlotBookingForm extends GetxController {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();

  final mobileController = TextEditingController();
  final addressController = TextEditingController();
  final vehicleController = TextEditingController();

  final paymentMode = RxString('Select Payment Mode');

  List<String> paymentModes = ['Cash', 'Card', 'UPI'];

  void submitForm() {
    if (formKey.currentState!.validate()) {
      print('Form submitted!');
      // Access form data:
      String name = nameController.text;
      String email = emailController.text;
      String mobile = mobileController.text;
      String address = addressController.text;
      String selectedPaymentMode = paymentMode.value;
    }
  }
}
