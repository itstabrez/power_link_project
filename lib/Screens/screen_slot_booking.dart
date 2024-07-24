import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScreenSlotBooking extends GetView<ScreenSlotBooking> {
  const ScreenSlotBooking({super.key});
  static String pageId = "/ScreenSlotBooking";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Book your slot now"),
      ),
    );
  }
}
