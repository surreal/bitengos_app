import 'package:flutter/material.dart';
import 'package:itcm_site/design/app_colors.dart';
import 'package:itcm_site/design/app_fonts.dart';
import 'package:itcm_site/helpers/centered_widget.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../data/constants.dart';
import 'orientation_helper.dart';

Widget getTextWidget(String text, {String fontFamily, FontWeight fontWeight, Color color, double fontSize, FontStyle fontStyle}) => SelectableText(
      text,
      textAlign: TextAlign.right,
      textDirection: TextDirection.rtl,
      style: TextStyle(fontWeight: fontWeight, fontSize: fontSize, fontFamily: fontFamily, color: color, fontStyle: fontStyle),
    );

Widget getTextWithDotWidget(String s) {
  return Container(
    padding: EdgeInsets.only(bottom: 5),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: SelectableText(
            s,
            textDirection: TextDirection.rtl,
            textAlign: TextAlign.right,
            style: TextStyle(fontSize: 18, color: blackColor, fontFamily: micSansFontFamily, fontWeight: FontWeight.w200),
          ),
        ),
        Text(
          ' *',
          style: TextStyle(fontFamily: openSansFontFamily, fontWeight: FontWeight.w900),
        ),
      ],
    ),
  );
}

Widget getTextNearImageWidget(BuildContext context, String imagePath, Widget textNearPicWidget, {double imageHeight}) {
  List<Widget> getWidgets(String imagePath) {
    return [
      ClipRRect(
        borderRadius: BorderRadius.circular(30.0),
        child: Image.asset(
          imagePath,
          fit: BoxFit.cover,
          width: screenSizeType == SCREEN_SIZE_DESKTOP ? 570 : screenWidth,
          height: imageHeight,
        ),
      ),
      SizedBox(width: 10),
      screenSizeType == SCREEN_SIZE_DESKTOP
          ? Expanded(child: CenteredWidget(centeredWidget: textNearPicWidget, paddingVertical: 20))
          : CenteredWidget(centeredWidget: textNearPicWidget, paddingVertical: 20)
    ];
  }

  return ConstrainedBox(
    constraints: BoxConstraints(maxWidth: 1100),
    child: Container(
      width: screenSizeType == SCREEN_SIZE_DESKTOP ? 1200 : screenWidth,
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(color: greyColor, borderRadius: BorderRadius.circular(35), border: Border.all(color: blueColor, width: 5)),
      child: screenSizeType == SCREEN_SIZE_DESKTOP ? Row(children: getWidgets(imagePath)) : Column(children: getWidgets(imagePath)),
    ),
  );
}

Widget getImageWithText(String title, String imagePath, double width, {BoxFit fit}) {
  return Container(
    decoration: BoxDecoration(color: greyColor, borderRadius: BorderRadius.circular(35), border: Border.all(color: blueColor, width: 5)),
    width: width,
    margin: EdgeInsets.only(bottom: 30, left: 10, right: 10),
    // padding: EdgeInsets.all(15),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(30.0),
          child: Image(
            fit: fit ?? BoxFit.fill,
            // height: 300,
            width: screenWidth,
            image: AssetImage(imagePath),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: SelectableText(
            title,
            style: TextStyle(fontFamily: micSansFontFamily, fontSize: 20, fontWeight: FontWeight.w500, color: blackColor),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    ),
  );
}

TextStyle _titleOriented(DeviceScreenType deviceScreenType) {
  double titleSize = deviceScreenType == DeviceScreenType.mobile ? 30 : 40;
  return TextStyle(fontWeight: FontWeight.w800, height: 0.9, fontSize: titleSize);
}

/// Return the style for description text on a page based on the [deviceScreenType] passed in.
TextStyle _descriptionOriented(DeviceScreenType deviceScreenType) {
  double descriptionSize = deviceScreenType == DeviceScreenType.mobile ? 16 : 18;
  return TextStyle(fontSize: descriptionSize, height: 1.7);
}
