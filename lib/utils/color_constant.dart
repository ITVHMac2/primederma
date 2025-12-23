import 'dart:ui';
import 'package:flutter/material.dart';

class ColorConstant {
  static Color primary = fromHex('#DE006F');
  static Color primaryLight = fromHex('#FF2D96');
  static Color secondary = fromHex('#003C52');
  static Color homeContainerGrey = fromHex('#F2F4F7');
  static Color homeText1 = fromHex('#003C52');
  static Color homeContainerShadow = fromHex('#101828');
  static Color videoBtn = fromHex('#6A78C9');
  static Color videoBackground = fromHex('#13181C');

  static Color bottomBarUnselect = fromHex('#BCECE0');

  static Color homeback = fromHex('#edf1fd');

  static Color primaryDark = fromHex('#303F9F');

  static Color text1 = fromHex('#212121');

  static Color text2 = fromHex('#757575');

  static Color divider = fromHex('#BDBDBD');

  static Color black9007f = fromHex('#7f000000');

  static Color gray600 = fromHex('#828282');

  static Color gray92 = fromHex('#ebebeb');

  static Color redA200 = fromHex('#ff655b');

  static Color gray800 = fromHex('#4f4f4f');

  static Color gray200 = fromHex('#efefef');

  static Color gray100 = fromHex('#f2f2f2');

  static Color bluegray700 = fromHex('#355c7d');

  static Color black900Cc = fromHex('#cc000000');

  static Color black900 = fromHex('#000000');

  static Color bluegray400 = fromHex('#888888');

  static Color black90028 = fromHex('#28000000');

  static Color pink300 = fromHex('#f15a87');

  static Color black90014 = fromHex('#14000000');

  static Color whiteA700 = fromHex('#ffffff');

  static Color logoTextColor = fromHex('#ff7096');

  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
