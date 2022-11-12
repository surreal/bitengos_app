import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:itcm_site/shared_views/secondary_title.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:itcm_site/design/app_colors.dart';
import 'package:itcm_site/design/app_fonts.dart';
// ignore: avoid_web_libraries_in_flutter

import '../../helpers/orientation_helper.dart';
import '../../data/constants.dart';

class AllProductsArea extends StatelessWidget {
  Widget getRelevantItem(String imagePath, String title, String description, String playStorePath) {
    return Container(
      decoration: BoxDecoration(color: greyColor, borderRadius: BorderRadius.circular(35), border: Border.all(color: blueColor, width: 5)),
      width: screenWidth >= 950 && screenWidth <= 1200 ? 380 : 380,
      margin: EdgeInsets.only(bottom: 30, left: 10, right: 10),
      // padding: EdgeInsets.all(15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(30.0),
            child: Image(
              fit: BoxFit.fill,
              height: 200,
              width: screenWidth,
              image: AssetImage(imagePath),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            child: SelectableText(
              title,
              style: TextStyle(fontFamily: micSansFontFamily, fontSize: 30, fontWeight: FontWeight.w700, color: blackColor),
              textAlign: TextAlign.center,
            ),
          ),
          SelectableText(
            description,
            textDirection: TextDirection.rtl,
            style: TextStyle(fontFamily: davidFontFamily, fontSize: 25, fontWeight: FontWeight.w200),
            textAlign: TextAlign.center,
          ),
          Container(
            height: 1,
            margin: EdgeInsets.only(bottom: 10, top: 10),
            color: blueColor,
          ),
          InkWell(
            child: SelectableText(
              'לפרטים צור קשר',
              style: TextStyle(fontFamily: davidFontFamily, fontSize: 20, fontWeight: FontWeight.w200),
              textAlign: TextAlign.center,
            ),
            // onTap: () => html.window.open(playStorePath, playStorePath),
          ),
          SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }

  List<Widget> getAllItems() {
    return [
      getRelevantItem(
          'assets/images/manof_building.jpg', 'Build It', 'אפלקציה מיועדת למהנדסים, קבלנים, מתכננים, אדריכלים, מעצבי פנים, שמאים, שיפוצניקים ועוד...', ''),
      getRelevantItem(
          'assets/images/circul_building.jpg', 'Structural Design', 'מטרתנו להקל על מהנדסים והנדסאים בתחום הבניה והתכנון בחישובי התכן, הבטון והפלדה.', '')
    ];
  }

  Widget imagesWithDescription(List<Widget> widgets) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(bottom: 50, top: 50),
          child: screenSizeType == SCREEN_SIZE_DESKTOP
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  // mainAxisSize: MainAxisSize.min,
                  children: widgets,
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.max,
                  children: widgets,
                ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        setScreenSize(sizingInformation.deviceScreenType);
        setGetScreenWidth(context);
        log('checkScreenWidth -> screenWidth == ' + setGetScreenWidth(context).toString() + '; sizeOf == ' + screenSizeType.toString());
        return Container(
          width: setGetScreenWidth(context),
          child: Column(
            children: <Widget>[
              SecondaryTitle('מוצרים שלנו'),
              widgetsOrganizer(getAllItems()),
            ],
          ),
        );
      },
    );
  }
}
