import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:prime_derma_blog/utils/color_constant.dart';
import 'package:prime_derma_blog/utils/constants.dart';
import 'package:prime_derma_blog/utils/global_controller.dart';
import 'text_style.dart';

class DialogUtils {
  static bool isProgressVisible = false;
  static void loading(context) {
    AlertDialog alert = const AlertDialog();
    alert = AlertDialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.all(0.0),
      titlePadding: const EdgeInsets.all(0.0),
      contentPadding: const EdgeInsets.all(0.0),
      content: Container(
        width: MediaQuery.of(context).size.width - 40 > 400
            ? 500
            : MediaQuery.of(context).size.width - 30,
        height: 280,
        //color: Colors.red,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 120,
              decoration: const BoxDecoration(
                color: Color(0xff515c6f),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20),
                  topLeft: Radius.circular(20),
                ),
              ),
              width: MediaQuery.of(context).size.width,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Lottie.asset(
                    'assets/gif/loading.json',
                    width: 150,
                    height: 150,
                  ),
                ),
              ),
            ),
            const Text(
              'Loading...',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const Text(
              "Please Wait",
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.normal,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) => alert,
    );
  }

  static void updateDialog(desc, cancelClick) {
    Get.dialog(
      Builder(
        builder: (context) {
          return AlertDialog(
            insetPadding: const EdgeInsets.all(0.0),
            titlePadding: const EdgeInsets.all(0.0),
            contentPadding: const EdgeInsets.all(0.0),
            backgroundColor: Colors.transparent,
            content: Container(
              width: MediaQuery.of(context).size.width - 40 > 400
                  ? 500
                  : MediaQuery.of(context).size.width - 40,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    height: 80,
                    decoration: const BoxDecoration(
                      color: Color(0xff515c6f),
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                        topLeft: Radius.circular(20),
                      ),
                    ),
                    width: MediaQuery.of(context).size.width,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 13.0),
                        child: Lottie.asset(
                          'assets/animations/update_app.json',
                          height: 100,
                          width: 100,
                          repeat: true,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Update App!',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      //color: CColor.text1,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8.0,
                      vertical: 10,
                    ),
                    child: Text(
                      desc,
                      maxLines: 4,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                        // color: CColor.text1,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Align(
                    alignment: Alignment.center,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        MaterialButton(
                          onPressed: cancelClick,
                          color: Colors.red,
                          child: const Text(
                            'Later',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        MaterialButton(
                          onPressed: () {
                            // Navigator.pop(context);
                            // if (Platform.isAndroid || Platform.isIOS) {
                            //   final appId = Platform.isAndroid
                            //       ? 'au.com.primemedic.doctors'
                            //       : '1573935765';
                            //   final url = Uri.parse(
                            //     Platform.isAndroid
                            //         ? "market://details?id=$appId"
                            //         : "https://apps.apple.com/app/id$appId",
                            //   );
                            //   launchUrl(
                            //     url,
                            //     mode: LaunchMode.externalApplication,
                            //   );
                            //   //Get.offAll(()=> const Login());
                            // }
                          },
                          color: const Color(0xff02895c),
                          child: const Text(
                            'Update Now',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 14),
                ],
              ),
            ),
          );
        },
      ),
      barrierDismissible: false,
    );
  }

  static void updateErrorDialog(description) {
    Get.dialog(
      Builder(
        builder: (context) {
          return AlertDialog(
            backgroundColor: Colors.transparent,
            insetPadding: const EdgeInsets.all(0.0),
            titlePadding: const EdgeInsets.all(0.0),
            contentPadding: const EdgeInsets.all(0.0),
            content: Container(
              width: Get.width - 40 > 400 ? 500 : Get.width - 30,
              height: 240,
              //color: Colors.red,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 80,
                    decoration: const BoxDecoration(
                      color: Color(0xff515c6f),
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                        topLeft: Radius.circular(20),
                      ),
                    ),
                    width: Get.width,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(0.0),
                        child: Lottie.asset(
                          'assets/animations/error.json',
                          width: 150,
                          height: 150,
                        ),
                      ),
                    ),
                  ),
                  const Text(
                    'Oops...',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                      //color: CColor.text1,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      description,
                      maxLines: 5,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                        //color: CColor.text1,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: MaterialButton(
                        onPressed: () {
                          // Navigator.pop(context);
                          // if (Platform.isAndroid || Platform.isIOS) {
                          //   final appId = Platform.isAndroid
                          //       ? 'au.com.primemedic.doctors'
                          //       : '1573935765';
                          //   final url = Uri.parse(
                          //     Platform.isAndroid
                          //         ? "market://details?id=$appId"
                          //         : "https://apps.apple.com/app/id$appId",
                          //   );
                          //   launchUrl(
                          //     url,
                          //     mode: LaunchMode.externalApplication,
                          //   );
                          //   //Get.offAll(()=> const Login());
                          // }
                        },
                        color: Colors.red,
                        height: 45,
                        minWidth: 150,
                        elevation: 6,
                        //splashColor: CColor.secondary,
                        textColor: Colors.white,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                        ),
                        child: const Text(
                          "Update Now",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      barrierDismissible: false,
    );
  }

  static void showImgCropProgressDialog({
    isCancellable = false,
    text = "Loading Please Wait...",
  }) async {
    if (!isProgressVisible) {
      Get.dialog(
        Material(
          color: Colors.black26,
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Lottie.asset(
                  'assets/animations/img_crop.json',
                  width: 150,
                  height: 150,
                ),
                Text(
                  text,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
        barrierDismissible: isCancellable,
      );
      isProgressVisible = true;
    }
  }

  ///common method for showing progress dialog
  static void showProgressDialog({
    isCancellable = false,
    text = "Loading Please Wait...",
  }) async {
    if (!isProgressVisible) {
      Get.dialog(
        Material(
          color: Colors.black26,
          child: Center(
            child: Container(
              height: 150,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              width: Get.size.width - 100,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      'assets/gif/loading.gif',
                      width: 100,
                      height: 100,
                    ),
                  ),
                  Text(
                    text,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        barrierDismissible: isCancellable,
      );
      isProgressVisible = true;
    }
  }

  static void imageProcessing({
    isCancellable = false,
    text = "Image Processing Please Wait...",
  }) async {
    if (!isProgressVisible) {
      Get.dialog(
        Material(
          color: Colors.black26,
          child: Center(
            child: Container(
              height: 150,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              width: Get.size.width - 100,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      'assets/animations/scan_body.json',
                      width: 100,
                      height: 100,
                    ),
                  ),
                  Text(
                    text,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        barrierDismissible: isCancellable,
      );
      isProgressVisible = true;
    }
  }

  ///common method for hiding progress dialog
  static void hideProgressDialog() {
    if (isProgressVisible) Get.back();
    isProgressVisible = false;
  }

  // success dialog method
  static void successDialog(context, description) {
    AlertDialog alert = const AlertDialog();
    alert = AlertDialog(
      insetPadding: const EdgeInsets.all(0.0),
      titlePadding: const EdgeInsets.all(0.0),
      contentPadding: const EdgeInsets.all(0.0),
      backgroundColor: Colors.transparent,
      content: Container(
        width: MediaQuery.of(context).size.width - 40 > 400
            ? 500
            : MediaQuery.of(context).size.width - 30,
        height: 280,
        //color: Colors.white,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 120,
              decoration: BoxDecoration(
                color: ColorConstant.primary,
                //Color(0xff515c6f),
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(20),
                  topLeft: Radius.circular(20),
                ),
              ),
              width: MediaQuery.of(context).size.width,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Lottie.asset(
                    'assets/animations/success.json',
                    width: 150,
                    height: 150,
                  ),
                ),
              ),
            ),
            Text(
              'Success!',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: ColorConstant.black9007f,
              ),
            ),
            FittedBox(
              fit: BoxFit.contain,
              alignment: Alignment.center,
              child: Text(
                description,
                maxLines: 4,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                  color: ColorConstant.black900,
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: MaterialButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  color: ColorConstant.primary,
                  height: 45,
                  minWidth: 150,
                  elevation: 6,
                  splashColor: ColorConstant.secondary,
                  textColor: Colors.white,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  ),
                  child: const Text(
                    "OK",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w800),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) => alert,
    );
  }

  static void errorDialog(description) {
    Get.dialog(
      AlertDialog(
        backgroundColor: Colors.transparent,
        insetPadding: const EdgeInsets.all(0.0),
        titlePadding: const EdgeInsets.all(0.0),
        contentPadding: const EdgeInsets.all(0.0),
        content: Container(
          width: Get.width - 40 > 400 ? 500 : Get.width - 30,
          height: 280,
          //color: Colors.red,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 120,
                decoration: BoxDecoration(
                  color: ColorConstant.primary,
                  //Color(0xff515c6f),
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20),
                  ),
                ),
                width: Get.width,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Lottie.asset(
                      'assets/animations/error.json',
                      width: 150,
                      height: 150,
                    ),
                  ),
                ),
              ),
              Text(
                'Oops...',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: ColorConstant.text1,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8),
                child: Text(
                  description,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    color: ColorConstant.text1,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: MaterialButton(
                    onPressed: () {
                      Get.back();
                    },
                    color: Colors.red,
                    height: 45,
                    minWidth: 150,
                    elevation: 6,
                    splashColor: ColorConstant.secondary,
                    textColor: Colors.white,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    ),
                    child: const Text(
                      "OK",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  static void infoDialog(context, desc) {
    showDialog(
      builder: (context) => AlertDialog(
        insetPadding: const EdgeInsets.all(0.0),
        titlePadding: const EdgeInsets.all(0.0),
        contentPadding: const EdgeInsets.all(0.0),
        backgroundColor: Colors.transparent,
        content: Container(
          width: MediaQuery.of(context).size.width - 40 > 400
              ? 500
              : MediaQuery.of(context).size.width - 30,
          height: 280,
          //color: Colors.white,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 120,
                decoration: BoxDecoration(
                  color: ColorConstant.primary,
                  //Color(0xff515c6f),
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20),
                  ),
                ),
                width: MediaQuery.of(context).size.width,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Lottie.asset(
                      'assets/animations/info.json',
                      width: 150,
                      height: 150,
                    ),
                  ),
                ),
              ),
              Text(
                'Info!',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: ColorConstant.text1,
                ),
              ),
              Text(
                desc,
                maxLines: 4,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                  color: ColorConstant.text1,
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: MaterialButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    color: Colors.red,
                    height: 45,
                    minWidth: 150,
                    elevation: 6,
                    splashColor: ColorConstant.secondary,
                    textColor: Colors.white,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    ),
                    child: const Text(
                      "OK",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      context: context,
    );
  }

  static void infoTwoButtonDialog(
    context,
    title,
    desc,
    onTap1,
    onTap2,
    text1,
    text2,
  ) {
    showDialog(
      builder: (context) => AlertDialog(
        insetPadding: const EdgeInsets.all(0.0),
        titlePadding: const EdgeInsets.all(0.0),
        contentPadding: const EdgeInsets.all(0.0),
        backgroundColor: Colors.transparent,
        content: Container(
          width: MediaQuery.of(context).size.width - 40 > 400
              ? 500
              : MediaQuery.of(context).size.width - 30,
          height: 280,
          //color: Colors.white,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 120,
                decoration: const BoxDecoration(
                  color: Color(0xff515c6f),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20),
                  ),
                ),
                width: MediaQuery.of(context).size.width,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Lottie.asset(
                      'assets/animations/info.json',
                      width: 150,
                      height: 150,
                      repeat: false,
                    ),
                  ),
                ),
              ),
              Text(title, style: TextStyleUtil.titleStyle),
              Text(
                desc,
                maxLines: 4,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: TextStyleUtil.normalText,
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 16,
                        right: 8,
                        bottom: 10,
                      ),
                      child: MaterialButton(
                        onPressed: onTap1,
                        color: ColorConstant.primary,
                        height: 45,
                        minWidth: 150,
                        elevation: 6,
                        splashColor: ColorConstant.secondary,
                        textColor: Colors.white,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                        ),
                        child: Text(
                          text1,
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 8,
                        right: 16,
                        bottom: 10,
                      ),
                      child: MaterialButton(
                        onPressed: onTap2,
                        color: ColorConstant.primary,
                        height: 45,
                        minWidth: 150,
                        elevation: 6,
                        splashColor: ColorConstant.secondary,
                        textColor: Colors.white,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                        ),
                        child: Text(
                          text2,
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      context: context,
    );
  }

  static void loginDialog({
    required Function() onclick,
    required Function() loginSuccess,
  }) {
    Get.dialog(
      Builder(
        builder: (context) {
          return AlertDialog(
            insetPadding: const EdgeInsets.all(0.0),
            titlePadding: const EdgeInsets.all(0.0),
            contentPadding: const EdgeInsets.all(0.0),
            backgroundColor: Colors.transparent,
            content: Container(
              width: MediaQuery.of(context).size.width - 40 > 400
                  ? 500
                  : MediaQuery.of(context).size.width - 40,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    height: 90,
                    decoration: BoxDecoration(
                      color: ColorConstant.primary,
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(20),
                        topLeft: Radius.circular(20),
                      ),
                    ),
                    width: MediaQuery.of(context).size.width,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Lottie.asset(
                          'assets/animations/account.json',
                          width: 150,
                          height: 150,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Your Request can't be fulfilled Yet!",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: ColorConstant.text1,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
                    child: Text(
                      "Please Login/Register to access this feature.",
                      maxLines: 4,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MaterialButton(
                          onPressed: () {
                            Get.back();
                          },
                          color: Colors.red,
                          height: 45,
                          minWidth: 120,
                          elevation: 6,
                          splashColor: ColorConstant.secondary,
                          textColor: Colors.white,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                          ),
                          child: const Text(
                            "Cancel",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                        MaterialButton(
                          onPressed: () {
                            Get.back();
                            if (Constants.touchID == 1) {
                              
                            } else {
                             // Get.to(() => const LoginScr());
                            }
                          },
                          color: Colors.green,
                          height: 45,
                          minWidth: 120,
                          elevation: 6,
                          splashColor: ColorConstant.secondary,
                          textColor: Colors.white,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                          ),
                          child: const Text(
                            "Login",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      barrierDismissible: false,
    );
  }

  static imageUploadAlert(
    String message, {
    Function()? cameraClick,
    Function()? galleryClick,
  }) async {
    Get.dialog(
      AlertDialog(
        shadowColor: Colors.black45,
        insetPadding: const EdgeInsets.only(left: 10, right: 10),
        titlePadding: const EdgeInsets.all(0),
        contentPadding: const EdgeInsets.all(0),
        elevation: 50,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
          side: const BorderSide(color: Colors.black38, width: 2),
        ),
        alignment: Alignment.center,
        scrollable: true,
        content: SingleChildScrollView(
          child: SizedBox(
            width: Get.width,
            child: Center(
              child: Column(
                children: [
                  const SizedBox(
                    width: 70,
                    height: 70,
                    child: Icon(Icons.photo),
                  ),
                  Text(
                    message,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        actions: [
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: cameraClick,
                  child: Column(
                    children: [
                      Icon(
                        Icons.camera,
                        size: 35,
                        color: ColorConstant.secondary,
                      ),
                      const Text('Camera'),
                    ],
                  ),
                ),
                const SizedBox(width: 20),
                GestureDetector(
                  onTap: galleryClick,
                  child: Column(
                    children: [
                      Icon(
                        Icons.folder,
                        size: 35,
                        color: ColorConstant.secondary,
                      ),
                      Text(Platform.isIOS ? "Photo Library" : "Gallery"),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
