import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:power_link_project/Controllers/controllers_notification.dart';

class ScreenNotificationPage extends GetView<ScreenNotificationPage> {
  ScreenNotificationPage({super.key});
  final ControllersNotificationScreen notificationController =
      Get.find<ControllersNotificationScreen>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
        backgroundColor: Colors.blueAccent,
        elevation: 4.0,
        actions: [
          IconButton(
            icon: const Icon(Icons.clear_all, color: Colors.white),
            onPressed: () {
              notificationController.clearNotifications();
            },
          ),
        ],
      ),
      body: Obx(
        () {
          if (notificationController.notifications.isEmpty) {
            return const Center(
              child: Text('No notifications'),
            );
          }
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView.builder(
              itemCount: notificationController.notifications.length,
              itemBuilder: (context, index) {
                final notification =
                    notificationController.notifications[index];
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 8.0),
                  elevation: 2.0,
                  child: ListTile(
                    leading: const Icon(
                      Icons.notifications,
                      color: Colors.blueAccent,
                    ),
                    title: Text(
                      notification.stationName,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.blueAccent,
                      ),
                    ),
                    subtitle: Text(
                      notification.getNotificationMessage(),
                      style: TextStyle(
                        color: Colors.grey[700],
                      ),
                    ),
                    contentPadding: const EdgeInsets.all(16.0),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
