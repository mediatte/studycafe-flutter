import 'package:librarybook/Views/Screens/admin/Add_product_form_screen.dart';
import 'package:librarybook/Views/Screens/admin/stock_screen.dart';
import 'package:librarybook/views/screens/forgot_password_screen.dart';
import 'package:librarybook/views/screens/login_screen.dart';
import 'package:librarybook/views/screens/setting/edit_profile_screen.dart';
import 'package:librarybook/views/screens/setting/profile.dart';
import 'package:librarybook/views/screens/setting/settings_screen.dart';
import 'package:librarybook/views/screens/signup_screen.dart';
import 'package:get/route_manager.dart';
import 'package:librarybook/views/screens/user/details.dart';

import 'Model/product.dart';
import 'Views/Screens/user/customer_home.dart';
import 'logic/bindings/auth_binding.dart';

class AppRoutes {
  static const login = Routes.loginScreen;

  static final routes = [
    GetPage(
        name: Routes.loginScreen,
        page: () => Login_Screen(),
        binding: AuthBinding()),
    GetPage(
        name: Routes.signScreen,
        page: () => SignUpScreen(),
        binding: AuthBinding()),
    GetPage(
        name: Routes.forgotpasswordScreen,
        page: () => ForgotPasswordScreen(),
        binding: AuthBinding()),
    GetPage(
        name: Routes.profileScreen,
        page: () => ProfileScreen(),
        binding: AuthBinding()),
    GetPage(
        name: Routes.editProfileScreen,
        page: () => EditProfileScreen(),
        binding: AuthBinding()),
    GetPage(
        name: Routes.settingsScreen,
        page: () => SettingScreen(),
        binding: AuthBinding()),
    GetPage(
        name: Routes.stockScreen,
        page: () => StockScreen(),
        binding: AuthBinding()),
    GetPage(
        name: Routes.addProductForm,
        page: () => AddProductFromScreen(),
        binding: AuthBinding()),
    GetPage(
        name: Routes.customerHome,
        page: () => CustomerHome(

        ),
        binding: AuthBinding()),
    GetPage(
        name: Routes.details,
        page: () {
          CafeDetails _c=Get.arguments;
          return _c;
        },
        binding: AuthBinding()),
  ];
}

class Routes {
  static const loginScreen = '/loginScreen';
  static const signScreen = '/signScreen';
  static const forgotpasswordScreen = '/forgotpasswordScreen';
  static const profileScreen = '/profileScreen';
  static const editProfileScreen = '/editProfileScreen';
  static const settingsScreen = '/settingsScreen';
  static const stockScreen='/stockScreen';
  static const addProductForm='/addProductForm';
  static const customerHome='/CustomerHome';
  static const details='/CafeDetails';

}
