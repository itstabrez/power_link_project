import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:power_link_project/Controllers/controllers_notification.dart';
import 'package:power_link_project/Controllers/controllers_slot_booking_form.dart';
import 'package:power_link_project/Screens/successful_booking_page.dart';
import 'package:power_link_project/model/model_notification_screen.dart';

class ScreenSlotBooking extends GetView<ScreenSlotBooking> {
  ScreenSlotBooking({super.key});
  static String pageId = "/ScreenSlotBooking";
  final controllerr = Get.put(ControllersSlotBookingForm());

  final ControllersNotificationScreen notificationController =
      Get.find<ControllersNotificationScreen>();
  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> args = Get.arguments ?? {};
    return Scaffold(
      appBar: AppBar(
        title: const Text('Booking Form'),
        backgroundColor: Colors.blueAccent,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: controllerr.formKey,
            child: Column(
              children: <Widget>[
                TextFormField(
                  controller: controllerr.nameController,
                  decoration: InputDecoration(
                    labelText: 'Name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blueAccent),
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                    ),
                    labelStyle: TextStyle(color: Colors.grey[700]),
                    hintText: 'Enter your name',
                    hintStyle: TextStyle(color: Colors.grey[400]),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: controllerr.emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                      borderSide: BorderSide(color: Colors.blueAccent),
                    ),
                    labelStyle: TextStyle(color: Colors.grey[700]),
                    hintText: 'Enter your email',
                    hintStyle: TextStyle(color: Colors.grey[400]),
                  ),
                  validator: (value) {
                    if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value!)) {
                      return 'Please enter a valid email address';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: controllerr.mobileController,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    labelText: 'Mobile Number',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                      borderSide: BorderSide(color: Colors.blueAccent),
                    ),
                    labelStyle: TextStyle(color: Colors.grey[700]),
                    hintText: 'Enter your mobile number',
                    hintStyle: TextStyle(color: Colors.grey[400]),
                  ),
                  validator: (value) {
                    if (value!.isEmpty || value.length != 10) {
                      return 'Please enter a valid mobile number';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: controllerr.vehicleController,
                  textCapitalization: TextCapitalization.characters,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'Vehicle Number',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                      borderSide: BorderSide(color: Colors.blueAccent),
                    ),
                    labelStyle: TextStyle(color: Colors.grey[700]),
                    hintText: 'Enter your vehicle number',
                    hintStyle: TextStyle(color: Colors.grey[400]),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter a valid vehicle number';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Obx(
                        () => TextFormField(
                          controller: controllerr.currentDateController.value,
                          decoration: InputDecoration(
                            label: const Text("Select Date"),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(25)),
                              borderSide: BorderSide(color: Colors.blueAccent),
                            ),
                          ),
                          readOnly: true,
                          onTap: () => controllerr.pickDate(context),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Obx(
                        () => TextFormField(
                          controller: controllerr.currentTimeController.value,
                          decoration: InputDecoration(
                            label: const Text("Select Time"),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(25)),
                              borderSide: BorderSide(color: Colors.blueAccent),
                            ),
                          ),
                          readOnly: true,
                          onTap: () => controllerr.pickTime(context),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: controllerr.addressController,
                  keyboardType: TextInputType.streetAddress,
                  decoration: InputDecoration(
                    labelText: 'Address',
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(25),
                      ),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(25),
                      ),
                      borderSide: BorderSide(color: Colors.blueAccent),
                    ),
                    labelStyle: TextStyle(color: Colors.grey[700]),
                    hintText: 'Enter your address',
                    hintStyle: TextStyle(color: Colors.grey[400]),
                  ),
                  maxLines: 3,
                ),
                const SizedBox(height: 16),
                Obx(
                  () => DropdownButtonFormField<String>(
                    value:
                        controllerr.paymentMode.value == 'Select Payment Mode'
                            ? null
                            : controllerr.paymentMode.value,
                    items: controllerr.paymentModes.map((mode) {
                      return DropdownMenuItem(
                        value: mode,
                        child: Text(mode),
                      );
                    }).toList(),
                    onChanged: (value) {
                      controllerr.paymentMode.value = value!;
                    },
                    decoration: InputDecoration(
                      labelText: 'Payment Mode',
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25)),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25)),
                        borderSide: BorderSide(color: Colors.blueAccent),
                      ),
                      labelStyle: TextStyle(color: Colors.grey[700]),
                      hintText: 'Select payment mode',
                      hintStyle: TextStyle(color: Colors.grey[400]),
                    ),
                    validator: (value) {
                      if (value == null || value == 'Select Payment Mode') {
                        return 'Please select a valid payment mode';
                      } else if (value == "UPI" || value.contains("Card")) {
                        // Show snackbar on validation error
                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          Get.snackbar(
                            "We're not accepting this payment method for now",
                            "You selected $value as your payment method",
                            snackPosition: SnackPosition.TOP,
                            backgroundColor: Colors.blue,
                            colorText: Colors.white,
                          );
                        });
                        // Return error message to prevent navigation
                        return 'Payment method not supported';
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // Validate form
                    if (controllerr.formKey.currentState!.validate()) {
                      // Create a new notification
                      notificationController.addNotification(NotificationModel(
                        stationName: args['stationName'],
                        date: controllerr.currentDateController.value.text,
                        time: controllerr.currentTimeController.value.text,
                        name: controllerr.nameController.value.text,
                        vehicleNo: controllerr.vehicleController.value.text,
                      ));
                      // Navigate to the success page with form data
                      Get.toNamed(
                        ScreenSuccessfulBooking.pageId,
                        arguments: {
                          'name': controllerr.nameController.text,
                          'email': controllerr.emailController.text,
                          'mobile': controllerr.mobileController.text,
                          'address': controllerr.addressController.text,
                          'paymentMode': controllerr.paymentMode.value,
                        },
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.blueAccent,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 15),
                    textStyle: const TextStyle(fontSize: 18),
                  ),
                  child: const Text('Submit'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
