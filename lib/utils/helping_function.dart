import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'Constants.dart';

class Functions {
  static sendJson(jsonMap, page) async {
    var jsonData;
    http.Response response;
    var isSuccess = false;
    var jsonError = {
      'DocType': 'Error',
      'DocDate': DateTime.now().toString(),
      'Message': 'Check Internet Connection & try again - Server Error!',
    };
    try {
      response = await http.post(
        Uri.parse('${Constants.serverUrl + page}.php'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(jsonMap),
      );
      if (kDebugMode) {
        print('Response--> ${response.body}');
        print("Status--->${response.statusCode}");
        // print("URL---${('${Constants.serverUrl + page}.php')}");
        if (Platform.isIOS) {
          log('Response--> ${response.body}');
          log("Status--->${response.statusCode}");
        }
      }
      // log("URL---${('${Constants.serverUrl + page}.php')}");
      if (response.statusCode == 200) {
        try {
          jsonData = json.decode(response.body);
          isSuccess = true;
        } on FormatException catch (e) {
          if (kDebugMode) {
            print('Catch--> $e');
          }
          isSuccess = false;
          return jsonError;
        }
      } else {
        isSuccess = false;
        return jsonError;
      }
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      isSuccess = false;
      return jsonError;
    } finally {
      if (isSuccess == false) {
        return jsonError;
      } else {
        return jsonData;
      }
    }
  }

  static bool isMobile(String number) {
    return RegExp(r'^04([0-9]{8})$').hasMatch(number);
  }

  // static bool isMobile(String number) {
  //   return RegExp(r'^(\+92|0)?3[0-9]{9}$').hasMatch(number);
  // }

  static bool isUKMobile(String number) {
    return RegExp(r'^(?:\+44\s?|0)7\d{9}$').hasMatch(number);
  }

  static bool isText(String text) {
    return RegExp(r'^[a-zA-Z]+$').hasMatch(text);
  }

  static bool isEmail(String email) {
    return RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email);
  }

  static bool validatePassword(String value) {
    return RegExp(
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$',
    ).hasMatch(value);
  }

  static bool validConsultNum(String value) {
    return RegExp(r'^(CONS-|PRES-|CERT-|REFE-)\d+$').hasMatch(value);
  }

  static bool validSerialNum(String value) {
    return RegExp(r'^[A-Za-z]{2}\d{8}$|^\d{8}[A-Za-z]{2}$').hasMatch(value);
  }

  static void closeKeyboard() {
    FocusManager.instance.primaryFocus?.unfocus();
  }

  //   static Future<bool> isConnected() async {
  //     var result = await Connectivity().checkConnectivity();
  //     if (result == ConnectivityResult.none) {
  //       return false;
  //     } else {
  //       return true;
  //     }
  //   }

  //   static Future<Object?> pickMedia({
  //     required bool isGallery,
  //   }) async {
  //     File imageFile;
  //     Future<CroppedFile?> croppedFile = ImageCropper().cropImage(
  //       sourcePath: imageFile.path,
  //       aspectRatio:  CropAspectRatio(ratioX: 1, ratioY: 1),
  //       aspectRatioPresets: [CropAspectRatioPreset.square],
  //       compressQuality: 10,
  //       compressFormat: ImageCompressFormat.jpg,
  //       uiSettings: [
  //         AndroidUiSettings(
  //           toolbarTitle: 'Crop Image',
  //           toolbarColor: ColorConstant.secondary,
  //           toolbarWidgetColor: Colors.white,
  //           hideBottomControls: true,
  //         ),
  //         IOSUiSettings(
  //           rotateClockwiseButtonHidden: false,
  //           rotateButtonsHidden: false,
  //         ),
  //       ],
  //     );
  //     final source = isGallery ? ImageSource.gallery : ImageSource.camera;
  //     final pickedFile = await ImagePicker().pickImage(source: source);

  //     if (pickedFile == null) return null;
  //     if (croppedFile == null) {
  //       return File(pickedFile.path);
  //     } else {
  //       return croppedFile;
  //     }
  //   }

  //   static String formatDate(
  //       {String pattern = 'dd-MMM-yyyy hh:mm:ss a', required String date}) {
  //     return DateFormat().format(DateTime.parse(date));
  //   }

  //   static Widget loadImage(
  //       {required double height, double width = double.infinity, url}) {
  //     return CachedNetworkImage(
  //       // color: ColorConstant.secondary,
  //       height: height,
  //       width: width,
  //       fit: BoxFit.fitWidth,
  //       placeholder: (context, url) {
  //         return CircularProgressIndicator.adaptive();
  //       },
  //       imageUrl: url,
  //       errorWidget: (context, url, error) {
  //         return Icon(
  //           Icons.error_outline_rounded,
  //           size: 60,
  //           color: ColorConstant.secondary,
  //         );
  //       },
  //     );
  //   }
}
