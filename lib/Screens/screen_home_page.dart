import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class ScreenHomePage extends GetView<ScreenHomePage> {
  const ScreenHomePage({super.key});
  static String pageId = "/ScreenHome";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Drawer(),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("This is HomePage"),
          ],
        ),
      ),
    );
  }
}
