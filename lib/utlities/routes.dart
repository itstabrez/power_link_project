import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:power_link_project/Screens/screen_charging_station_details_page.dart';
import 'package:power_link_project/Screens/screen_google_map.dart';
import 'package:power_link_project/Screens/screen_login_page.dart';
import 'package:power_link_project/Screens/screen_slot_booking_form.dart';

class AppPages {
  static final List<GetPage> pages = [
    GetPage(
      name: ScreenLoginPage.pageId,
      page: () => ScreenLoginPage(),
    ),
    GetPage(
      name: ScreenGoogleMapScreen.pageId,
      page: () => ScreenGoogleMapScreen(),
    ),
    GetPage(
      name: ScreenSlotBooking.pageId,
      page: () => ScreenSlotBooking(),
    ),
    GetPage(
      name: ScreenChargingStationDetailsPage.pageId,
      page: () => ScreenChargingStationDetailsPage(),
    ),
  ];
}
