import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:itcm_site/design/app_fonts.dart';
import 'package:itcm_site/helpers/centered_widget.dart';
import 'package:itcm_site/helpers/orientation_helper.dart';
import 'package:itcm_site/helpers/text_helper.dart';
import 'package:itcm_site/shared_views/bottom_line.dart';
import 'package:itcm_site/shared_views/secondary_title.dart';
import 'package:itcm_site/toolbar/toolbar_custom.dart';
import 'package:itcm_site/data/constants.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../helpers/navigation_helper.dart';
import '../../shared_views/main_title.dart';
import '../../shared_views/shared_views.dart';
import '../../toolbar/drawer/drawer_custom.dart';

class BuildItPage extends StatefulWidget {
  BuildItPage() {
    selectedRout = BUILD_IT_ROUT;
  }
  _BuildItPage createState() => _BuildItPage();
}

class _BuildItPage extends State<BuildItPage> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final String presentationImagePath = 'assets/images/build_it_pic.jpeg';
  final String _exampleOneImagePath = 'assets/images/build_it_example_1.png';
  final String _exampleTwoImagePath = 'assets/images/build_it_example_2.png';
  final String _exampleThreeImagePath = 'assets/images/build_it_example_3.png';
  final String _descriptionA = 'החלטתם לשפץ את הבית / המבנה או לבצע תוספת בניה?\nאתם יודעים מה נדרש לעשות?\nאתם יודעים מה התקציב שלכם?\nהאם התקציב מתאים לדרישות?\n';
  final _descriptionB = 'ע"י אפליקציית בילידיט:';
  final _descriptionC =
      '1. תחסכו זמן.\n2. תוכלו לפנות לקבלנים עם רשימה מסודרת.\n3. פניה לקבלנים עם דרישה מפורטת ומסודרת שהפקתם ע"י האפליקציה חוסכת כ 10,000 שקל בממוצע.';
  // final String _description =
  //     'כיום, כאשר אנשים רוצים לבנות / לשפץ את הבית הם לא יודעים את העלות אפילו לא אומדן קרוב שמתאים לצרכים שלהם.\n\nהמערכת מאפשרת ע"י מספר שאלות פשוטות כגון: כמה נק\' תאורה יש בבית, כמה דלתות יש בבית, מה גודל / שטח הדירה, כמה נקודות מים - להוציא דוח מפורט הכולל סעיפים שנמצאים בבסיס נתונים הכוללים: מספר סעיף, תיאור, מחיר.\n\nבהתאם לתשובות של הלקוח המערכת יודעת בידוק מה המחיר של השיפוץ (סטייה קטנה מאוד) ביחס למה שקורה היום בשוק.\n\nלאחר שיוצא הדוח במערכת / אפלקציה ניתן לשלוח אותו למכרז ולקבל תשובה דיגיטלית עם הנחה.\n\nלאחר שהוחלט מתבצע חתימה דיגיטלית בין לקוח וקבלן.\n\nלאחר תחילת השיפוץ לקבלן יש אפשרות לציין במערכת מה בוצע, לתעד זאת ע"י תמונות והמערכת מחשבת בדיוק מה העלות שעל הלקוח לשלם בהתאם להתקדמות.';

  @override
  Widget build(BuildContext context) {
    log('$TAG_CHECK_LIFECYCLE HomeView{} -> build()');
    return ResponsiveBuilder(builder: (context, sizingInformation) {
      setScreenSizes(context, sizingInformation.deviceScreenType);
      return Scaffold(
        endDrawer: sizingInformation.deviceScreenType == DeviceScreenType.mobile ? DrawerCustom(scaffoldKey) : null,
        key: scaffoldKey,
        body: RefreshIndicator(onRefresh: _pullToRefresh, child: _getMainWidget(context)),
      );
    });
  }

  Widget _getMainWidget(BuildContext context) {
    return Column(
      children: [
        ToolbarCustom(scaffoldKey),
        Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: <Widget>[
                MainTitle(),
                SecondaryTitle('בילד איט - אפליקציה לניהול עבודות בניה ושיפוצים'),
                CenteredWidget(
                    centeredWidget: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        getTextWidget(_descriptionA, fontFamily: lucidaSansFontFamily, fontWeight: FontWeight.w500, fontSize: 22, fontStyle: FontStyle.italic),
                        getTextWidget(_descriptionB, fontFamily: lucidaSansFontFamily, fontWeight: FontWeight.w600, fontSize: 22),
                        getTextWidget(_descriptionC, fontFamily: lucidaSansFontFamily, fontWeight: FontWeight.w500, fontSize: 22),
                      ],
                    ),
                    paddingVertical: 40),
                getTextNearImageWidget(context, presentationImagePath, _dottedTextMainWidget, imageHeight: 370),
                widgetsOrganizer([
                  getImageWithText('קל לשפץ \\ לבנות עם בילד איט', _exampleOneImagePath, 350, fit: BoxFit.cover),
                  getImageWithText('אפליקציה מאפשרת לבחור סעיף מתוך מאגר או ליצור סעיף', _exampleTwoImagePath, 350, fit: BoxFit.cover),
                  getImageWithText('קיים מבחר של הנחיות מקצועיות שחוסכות זמן וכסף ', _exampleThreeImagePath, 350, fit: BoxFit.cover),
                ]),
                // SizedBox(height: 20, width: 20),
                contactUsBtnArea(context),
                BottomLine(),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget get _dottedTextMainWidget => Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          getTextWidget('Build it', fontFamily: lucidaSansFontFamily, fontWeight: FontWeight.w700, fontSize: 22),
          SizedBox(height: 10),
          getTextWithDotWidget('אפלקציית מבוססת  אלגוריתמים המאפשר להכין כתב כמויות / הצעת מחיר לפני יציאה למכרז.'),
          getTextWithDotWidget('חוסכת זמן וכסף בבדיקת עלות העבודות הנדסת הבניין / הדירה.'),
          getTextWithDotWidget('ניהול פרויקטים : רשימת פרויקטים לפי שלבים ולקוחות.'),
          getTextWithDotWidget('מערכת מבוססת DATA BASE מעודכן, גמישות בהכנת כתב כמויות כולל תיאור, מחיר ותמונה.'),
          getTextWithDotWidget('עדכון מצב סטטוס הפרויקט בכל זמן נתון.'),
          getTextWithDotWidget('ביצוע מכרז דיגיטלי בין קבלן ולקוח - חיסכון של זמן וכסף עוד לפני יציאה לביצוע.'),
          getTextWithDotWidget('חתימה חוזה בין צד קבלן ולקוח באופן דיגיטלי.'),
          getTextWithDotWidget('תיעוד בענן לכל הצעת מחיר / כתב כמויות / ניהול פרויקט.'),
        ],
      );

  Future _pullToRefresh() async => setState(() {});
}
