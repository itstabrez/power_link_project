class NotificationModel {
  final String stationName;
  final String date;
  final String time;
  final String name;
  final String vehicleNo;

  NotificationModel({
    required this.stationName,
    required this.date,
    required this.time,
    required this.name,
    required this.vehicleNo,
  });
  // Method to generate a notification message
  String getNotificationMessage() {
    return 'You booked a slot at $stationName scheduled on $date $time for $vehicleNo vehicle number.';
  }
}
