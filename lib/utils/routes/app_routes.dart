import 'package:get/get.dart';
import 'package:prime_derma_blog/presentation/index/index.dart';
import 'package:prime_derma_blog/presentation/index/index_bin.dart';

class AppRoutes {

  static String blog = '/blog_scr';
  static String settingScr = '/setting_scr';
  static String webScr = '/web_scr';

  static String initialRoute = '/initialRoute';

  static List<GetPage> pages = [
    GetPage(
      name: initialRoute,
      page: () => IndexPage(),
      bindings: [IndexBin()],
      transition: Transition.rightToLeft,
      //transitionDuration: Duration(seconds: 2),
    ),
    // GetPage(
    //   name: loginScr,
    //   page: () => LoginScr(),
    //   bindings: [
    //     LoginBin(),
    //   ],
    // ),
    // GetPage(
    //   name: homeScr,
    //   page: () => HomeScr(),
    //   bindings: [
    //     HomeBin(),
    //   ],
    // ),
    // GetPage(
    //   name: searchBookingScr,
    //   page: () => SearchBookingScr(),
    //   bindings: [
    //     SearcgBookingBin(),
    //   ],
    // ),
    // GetPage(
    //   name: conversationScr,
    //   page: () => ConveScr(),
    //   bindings: [
    //     ConveBin(),
    //   ],
    // ),
    // GetPage(
    //   name: chatScr,
    //   page: () => ConveScr(),
    //   bindings: [
    //     ChatBin(),
    //   ],
    // ),
    // GetPage(
    //   name: chatConsultScr,
    //   page: () => ChatConsultScr(),
    //   bindings: [
    //     ChatConsultBin(),
    //   ],
    // ),
    // GetPage(
    //   name: notificationScr,
    //   page: () => NotificationScr(),
    //   bindings: [
    //     NotificationBin(),
    //   ],
    // ),
    // GetPage(
    //   name: settingScr,
    //   page: () => SettingScr(),
    //   bindings: [
    //     SettingBin(),
    //   ],
    // ),
    // GetPage(
    //   name: signup,
    //   page: () => RegisterUser(),
    //   bindings: [
    //     SignupBinding(),
    //   ],
    // ),
    // GetPage(
    //   name: subcategory,
    //   page: () => SubCategoryPage(),
    //   bindings: [
    //     SubCategoryBin(),
    //   ],
    // ),
  ];
}
