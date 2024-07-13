import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:power_link_project/Screens/screen_google_map.dart';
import 'package:power_link_project/Screens/screen_home_page.dart';

class AppPages {
  static final List<GetPage> pages = [
    GetPage(
      name: ScreenHomePage.pageId,
      page: () => ScreenHomePage(),
    ),
    GetPage(
      name: ScreenGoogleMapScreen.pageId,
      page: () => ScreenGoogleMapScreen(),
    ),
  ];
}
