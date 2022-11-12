import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../data/constants.dart';

int screenSizeType = SCREEN_SIZE_DESKTOP;
double screenWidth = 0, screenHeight = 0;

Widget widgetsOrganizer(List<Widget> widgetsList) {
  log('$TAG_CHECK_LIFECYCLE widgetsOrganizer{} -> screenSizeType: $screenSizeType');
  return Padding(
    padding: EdgeInsets.only(bottom: 50, top: 50),
    child: screenSizeType == SCREEN_SIZE_DESKTOP
        ? Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            // mainAxisSize: MainAxisSize.min,
            children: widgetsList,
          )
        : Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            children: widgetsList,
          ),
  );
}

double setGetScreenHeight(BuildContext context) {
  screenHeight = MediaQuery.of(context).size.height;
  log('$TAG_CHECK_VALUES screenHeight: $screenHeight');
  return MediaQuery.of(context).size.height;
}

double setGetScreenWidth(BuildContext context) {
  screenWidth = MediaQuery.of(context).size.width;
  log('$TAG_CHECK_VALUES screenWidth: $screenWidth');
  return MediaQuery.of(context).size.width;
}

int getScreenSize(DeviceScreenType deviceScreenType) {
  switch (deviceScreenType) {
    case DeviceScreenType.mobile:
      return SCREEN_SIZE_MOBILE;
    case DeviceScreenType.tablet:
      return SCREEN_SIZE_TABLET;
    case DeviceScreenType.watch:
      return -1;
    case DeviceScreenType.desktop:
    default:
      return SCREEN_SIZE_DESKTOP;
  }
}

void setScreenSize(DeviceScreenType deviceScreenType) {
  screenSizeType = getScreenSize(deviceScreenType);
  log('$TAG_CHECK_VALUES setRelevantScreenSize() -> screenSizeType: $screenSizeType');
}

setScreenSizes(BuildContext context, DeviceScreenType deviceScreenType) {
  setScreenSize(deviceScreenType);
  setGetScreenWidth(context);
  setGetScreenHeight(context);
}
