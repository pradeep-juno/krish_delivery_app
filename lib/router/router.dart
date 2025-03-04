import 'package:get/get.dart';
import 'package:krish_delivery_customer/screens/Cart/coupon_apply_screen.dart';
import 'package:krish_delivery_customer/screens/Cart/order_summary_screen.dart';
import 'package:krish_delivery_customer/screens/Profile/profile_sub_Screen/contact_us_screen.dart';
import 'package:krish_delivery_customer/screens/Profile/profile_sub_Screen/my_order_screen.dart';
import 'package:krish_delivery_customer/screens/Profile/user_profile.dart';
import 'package:krish_delivery_customer/screens/bottom_nav_bar.dart';
import 'package:krish_delivery_customer/screens/category/categories_screen.dart';
import 'package:krish_delivery_customer/screens/home/restaurent_screen.dart';
import 'package:krish_delivery_customer/screens/home/select_address.dart';

import '../screens/home/main_home_screen/homescreen.dart';
import '../screens/splash_screen.dart';

class AppRouter {
  static const BOTTOM_NAV_BAR = '/bottom-nav-bar';
  static const HOME_SCREEN = '/home-screen';
  static const CATEGORY_SCREEN = '/category-screen';
  static const SELECT_ADDRESS_PAGE = '/select-address-page';
  static const RESTAURENT_SCREEN = '/restaurent-screen';
  static const ORDER_SUMMARY_SCREEN = '/order-summary-screen';
  static const COUPON_APPLY_SCREEN = '/coupon-apply-screen';
  static const ALERT_DIALOG = '/alert-dialog';
  static const SPLASH_SCREEN = '/splash-screen';
  static const USER_PROFILE = '/user-profile';
  static const MY_ORDER_SCREEN = '/my-order-screen';
  static const CONTACT_US_SCREEN = '/contact-us-screen';

  static var routes = [
    GetPage(name: BOTTOM_NAV_BAR, page: () => BottomNavBar()),
    GetPage(name: HOME_SCREEN, page: () => Homescreen()),
    GetPage(
      name: CATEGORY_SCREEN,
      page: () => CategoryScreen(onBackPress: () {}),
    ),
    GetPage(name: SELECT_ADDRESS_PAGE, page: () => SelectAddressPage()),
    GetPage(name: RESTAURENT_SCREEN, page: () => RestaurantScreen()),
    GetPage(name: ORDER_SUMMARY_SCREEN, page: () => OrderSummaryScreen()),
    GetPage(name: COUPON_APPLY_SCREEN, page: () => CouponApplyScreen()),
    GetPage(name: SPLASH_SCREEN, page: () => SplashScreen()),
    GetPage(name: USER_PROFILE, page: () => UserProfile()),
    GetPage(name: MY_ORDER_SCREEN, page: () => MyOrderScreen()),
    GetPage(name: CONTACT_US_SCREEN, page: () => ContactUsScreen()),
  ];
}
