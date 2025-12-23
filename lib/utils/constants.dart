import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prime_derma_blog/utils/color_constant.dart';

class Constants {
  static String serverUrl = 'http://39.61.32.75:7681/SkinCancer/ajaxs/app/';
  static String websiteUrl = 'http://39.61.32.75:7681/SkinCancer/';
  // static String serverUrl =
  //     'https://www.primemedic.com.au/ajaxs/doctor_app_v2/';
  // static String websiteUrl = 'https://www.primemedic.com.au/';

  static String imagesUrl = '${websiteUrl}images/apps/';
  static String bannerUrl = '${imagesUrl}banner/';
  static String iconUrl = '${imagesUrl}icons/';
  static RxString userImg =
      'https://firebasestorage.googleapis.com/v0/b/prime-medic-au.appspot.com/o/images%2Fuser.png?alt=media&token=f27be702-a133-4190-90b1-00e612652a41'
          .obs;

  static var countryCode = 'AU';
  static var currencySymbol = 'Au\$';
  static RxString subscriptionName = 'Basic'.obs;

  static String profileImage = "";
  static String appkey = "";
  static RxString fullName = "".obs;
  static RxString firstName = "".obs;
  static String email = "";
  static RxString userName = "".obs;
  static String password = "";
  static String appToken = "";
  static int userID = 0;
  static String age = "";
  static int gender = 0;

  static String appVersion = '';
  static RxInt login = 0.obs;
  static RxBool isLoggedIn = false.obs;
  static int touchID = 0;
  static int authAvail = 0;

  static Widget circularIndicator = Center(
    child: CircularProgressIndicator(
      value: 0.3,
      color: ColorConstant.primary,
      backgroundColor: Colors.grey,
      valueColor: AlwaysStoppedAnimation(ColorConstant.primary),
    ),
  );
}
