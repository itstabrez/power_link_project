import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:power_link_project/Controllers/controllers.drawer.dart';

class MyDrawerScreen extends GetView<MyDrawerScreen> {
  MyDrawerScreen({super.key});

  final controllerr = Get.put(ControllerMyDrawer());
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.blueGrey,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              padding: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                margin: EdgeInsets.zero,
                accountName: Text(controllerr.username),
                accountEmail:
                    Text(controllerr.email), // Use email here directly
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(controllerr.imageUrl),
                ),
                decoration: const BoxDecoration(
                  color: Colors.blueGrey,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
