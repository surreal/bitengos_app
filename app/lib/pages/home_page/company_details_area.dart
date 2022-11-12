import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:itcm_site/shared_views/secondary_title.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:itcm_site/design/app_fonts.dart';

import '../../helpers/orientation_helper.dart';
import '../../data/constants.dart';

class CompanyDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        setScreenSize(sizingInformation.deviceScreenType);
        setGetScreenWidth(context);
        log('checkScreenWidth -> screenWidth == ' + setGetScreenWidth(context).toString() + '; sizeOf == ' + screenSizeType.toString());
        return Container(
          color: Colors.white,
          width: setGetScreenWidth(context),
          child: Container(
            margin: EdgeInsets.only(top: 40, bottom: screenSizeType == SCREEN_SIZE_DESKTOP ? 30 : 0),
            child: Column(
              children: <Widget>[
                SecondaryTitle('החטיבות שלנו'),
                SizedBox(
                  height: 40,
                ),
                Container(
                  padding: EdgeInsets.only(top: 30, left: 10, right: 10),
                  // margin: EdgeInsets.only(bottom: 20),
                  width: setGetScreenWidth(context) - 50,
                  //decoration: BoxDecoration(borderRadius: BorderRadius.circular(35), border: Border.all(color: blackColor, width: 5)),
                  child: screenSizeType == SCREEN_SIZE_DESKTOP
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          mainAxisSize: MainAxisSize.max,
                          // crossAxisAlignment: CrossAxisAlignment.center,
                          children: _getAllItems(),
                        )
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.max,
                          children: _getAllItems(),
                        ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _getRelevantItem(String imagePath, String title, String description) {
    return Container(
      padding: EdgeInsets.only(left: 5, right: 5),
      width: 300,
      height: 400,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(30.0),
            child: Image(
              fit: BoxFit.fill,
              height: 200,
              width: 300,
              image: AssetImage(imagePath),
            ),
          ),
          SizedBox(height: 20),
          SelectableText(
            title,
            style: TextStyle(fontFamily: micSansFontFamily, fontSize: 25, fontWeight: FontWeight.w700),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 10),
          SelectableText(
            description,
            style: TextStyle(fontFamily: lucidaSansFontFamily, fontSize: 20, fontWeight: FontWeight.w200),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  List<Widget> _getAllItems() {
    return [
      _getRelevantItem('assets/images/business_plan.png', 'הנדסה אזרחית', 'יעוץ, תכנון, פיקוח וניהול פרויקטים'),
      _getRelevantItem('assets/images/home_check.png', 'בדק בית', 'ביצוע בדק בית לפני רכישה, מתן חוות דעת הנדסית לבית משפט, יעוץ הנדסי לאיכות בניה'),
      _getRelevantItem('assets/images/painting.png', 'צווי סכנה \\ מבנים מסוכנים', 'ביצוע וניהול פרויקטים'),
    ];
  }
}
// Text(' ל "אי טי סי אם" ישנם מספר חטיבות, כאשר כל חטיבה עוסקת בפיתוח אחזקה ושירות בתחום בו היא מתמחה כגון: חטיבת הנדסה אזרחית הכולל: יעוץ, תכנון,  פיקוח וניהול פרויקטים. הנדסה פיתוח מערכות: פיתוח מערכות תוכנה בהתאם לדרישות לקוח על פלטפורמות שונות.הנדסת חשמל: ביצוע וניהול פרויקטים ועוד',style: descriptionTextStyle(sizingInformation.deviceScreenType),textAlign: textAlignment,)
