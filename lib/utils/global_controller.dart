import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:prime_derma_blog/utils/constants.dart';

class GlobalController extends GetxController {
  static String email = "";
  static String password = "";

  // static final LocalAuthentication auth = LocalAuthentication();

  // static localAuthSignIn({required Function() onclick}) async {
  //   Get.back(); // Close any existing dialogs or screens.
  //   bool authenticated = false;
  //   bool userChoseSkip =
  //       await showDialog<bool>(
  //         context: Get.context!,
  //         builder: (BuildContext context) {
  //           return AlertDialog(
  //             title: const Text("Choose Authentication?"),
  //             content: Text(
  //               "Do you want to use Biometric, Face or PIN for authentication?",
  //               style: TextStyle(color: ColorConstant.secondary),
  //             ),
  //             actions: [
  //               Row(
  //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                 children: [
  //                   Expanded(
  //                     child: TextButton(
  //                       onPressed: () {
  //                         Navigator.of(context).pop(false);
  //                         // Get.to(() => const LoginScr());
  //                       },
  //                       child: Text(
  //                         "cancel",
  //                         style: TextStyle(color: ColorConstant.primary),
  //                         maxLines: 1,
  //                         overflow: TextOverflow.ellipsis,
  //                       ),
  //                     ),
  //                   ),
  //                   Expanded(
  //                     child: TextButton(
  //                       onPressed: () async {
  //                         try {
  //                           authenticated = await auth.authenticate(
  //                             localizedReason:
  //                                 'Let OS determine authentication method',
  //                             options: const AuthenticationOptions(
  //                               stickyAuth: true,
  //                             ),
  //                           );
  //                         } on PlatformException catch (e) {
  //                           debugPrint("---> Local Auth Error: $e");
  //                           Navigator.of(context).pop(false);
  //                           return;
  //                         }
  //                         if (authenticated) {
  //                           Navigator.of(context).pop(true);
  //                           DialogUtils.showProgressDialog();
  //                           validateUser(onclick: onclick);
  //                         }
  //                       },
  //                       child: Text(
  //                         "Use Biometric",
  //                         style: TextStyle(color: ColorConstant.primary),
  //                         maxLines: 1,
  //                         overflow: TextOverflow.ellipsis,
  //                       ),
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //             ],
  //           );
  //         },
  //       ) ??
  //       false;
  //   if (!userChoseSkip) {
  //     // Get.to(() => const LoginScr());
  //   }
  // }

  // static localAuthSignIn({required Function() onclick}) async {
  //   Get.back();
  //   bool authenticated = false;
  //   try {
  //     authenticated = await auth.authenticate(
  //       localizedReason: 'Let OS determine authentication method',
  //       options: const AuthenticationOptions(stickyAuth: true),
  //     );
  //   } on PlatformException catch (e) {
  //     debugPrint("---> Local Auth Error: $e");
  //     return;
  //   }
  //   if (authenticated) {
  //     // Get.back();
  //     DialogUtils.showProgressDialog();
  //     validateUser(onclick: onclick);
  //   }
  // }

  }
