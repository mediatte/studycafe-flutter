import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../logic/controllers/auth_controller.dart';
import '../../../logic/controllers/setting_controller.dart';
import '../../../routes.dart';
import '../../../utils/text_utils.dart';
import '../../widgets/settings/change_password.dart';
import '../../widgets/settings/edit_profile.dart';
import '../../widgets/settings/logout.dart';
import '../../widgets/settings/notification.dart';
import '../../widgets/settings/settings.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({Key? key}) : super(key: key);

  final controller = Get.put(SettingController());
  final authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    print("image path ${controller.imagePath1}");
    print("username ${authController.displayUserName.value}");
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Get.isDarkMode ? Colors.black : Colors.white,
            centerTitle: true,
            elevation: 0,
            automaticallyImplyLeading: false,
            title: Text(
              'Profile',
              style: TextStyle(color: Colors.black),
            ),
          ),
          body: GetBuilder<AuthController>(builder: (_) {
            return Obx(() => Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: authController.displayUserPhoto.value == ""
                                  ? const AssetImage("assets/images/avtar.png")
                                      as ImageProvider
                                  : NetworkImage(
                                      authController.displayUserPhoto.value,
                                    ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 2.5.h,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: TextUtils(
                          text: authController.displayUserName.value,
                          color: Colors.black,
                          fontsize: 12.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 0.6.h,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: TextUtils(
                          text: authController.displayDescription.value,
                          color: Colors.black87,
                          fontsize: 9.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        height: 0.6.h,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: TextUtils(
                          text: authController.displayUserEmail.value,
                          color: Colors.black45,
                          fontsize: 9.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: TextUtils(
                          fontsize: 14.sp,
                          fontWeight: FontWeight.bold,
                          text: "Account",
                          color: Colors.grey.shade700,
                        ),
                      ),
                      SizedBox(
                        height: 2.5.h,
                      ),
                      EditProfile(),
                      Divider(
                        color: Colors.grey.shade300,
                        thickness: 1,
                      ),
                      SizedBox(
                        height: 0.5.h,
                      ),
                      SettingsWidget(),
                      SizedBox(
                        height: 0.5.h,
                      ),
              InkWell(
                onTap: () {
                  _launchURL("tel:966533264666");
                  Get.toNamed(Routes.customerHome);
                },
                child:
                      Text(
                        "PhoneNumberً",
                        style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w300,
                            color: Colors.black),

                          ),
                      ),
                    ],
                  ),
                ));
          })),
    );
  }

  _launchURL(String s) async {
    final uri = Uri.parse(s);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $s';
    }
  }
}
