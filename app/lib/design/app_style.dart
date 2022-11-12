import 'package:flutter/material.dart';
import 'package:itcm_site/design/app_fonts.dart';

import 'app_colors.dart';

Decoration getOvalDecoration(Color color, Color bordersColor) => BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(15),
      border: Border.all(color: bordersColor, width: 3),
    );

Decoration getOvalDecor() => BoxDecoration(
      color: whiteColor,
      borderRadius: BorderRadius.circular(15),
      border: Border.all(color: blueColor, width: 3),
    );

TextStyle getButtonTextStyle([Color textColor]) => TextStyle(
      fontWeight: FontWeight.bold,
      color: textColor == null ? blackColor : textColor,
      fontSize: 16,
      fontFamily: lucidaSansFontFamily,
    );
