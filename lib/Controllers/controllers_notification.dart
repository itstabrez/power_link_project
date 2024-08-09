import 'package:get/get.dart';
import 'package:power_link_project/model/model_notification_screen.dart';

class ControllersNotificationScreen extends GetxController {
  var notifications = <NotificationModel>[].obs;

  void addNotification(NotificationModel notification) {
    notifications.insert(
        0, notification); // Insert at the beginning of the list
  }

  void clearNotifications() {
    notifications.clear();
  }
}
