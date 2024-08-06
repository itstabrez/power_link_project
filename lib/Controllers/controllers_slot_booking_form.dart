import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ControllersSlotBookingForm extends GetxController {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();

  final mobileController = TextEditingController();
  final addressController = TextEditingController();
  final vehicleController = TextEditingController();
  var currentDateController = TextEditingController().obs;
  var currentTimeController = TextEditingController().obs;

  @override
  void onInit() {
    super.onInit();
    DateTime now = DateTime.now();
    currentDateController.value.text = DateFormat('yyyy-MM-dd').format(now);
    currentTimeController.value.text = DateFormat('hh:mm a').format(now);
  }

  // DATE AND TIME PICKER

  Future<void> pickDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null) {
      currentDateController.value.text =
          DateFormat('yyyy-MM-dd').format(pickedDate);
    }
  }

  Future<void> pickTime(BuildContext context) async {
    TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (pickedTime != null) {
      DateTime now = DateTime.now();
      DateTime selectedTime = DateTime(
        now.year,
        now.month,
        now.day,
        pickedTime.hour,
        pickedTime.minute,
      );
      currentTimeController.value.text =
          DateFormat('hh:mm a').format(selectedTime);
    }
  }

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
