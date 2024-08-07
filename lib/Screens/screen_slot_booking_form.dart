import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:power_link_project/Controllers/controllers_slot_booking_form.dart';

class ScreenSlotBooking extends GetView<ScreenSlotBooking> {
  ScreenSlotBooking({super.key});
  static String pageId = "/ScreenSlotBooking";
  final controllerr = Get.put(ControllersSlotBookingForm());

  @override
  Widget build(BuildContext context) {
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
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: controllerr.submitForm,
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
