import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:itcm_site/design/app_fonts.dart';
import 'package:itcm_site/helpers/centered_widget.dart';
import 'package:itcm_site/helpers/orientation_helper.dart';
import 'package:itcm_site/helpers/text_helper.dart';
import 'package:itcm_site/shared_views/bottom_line.dart';
import 'package:itcm_site/shared_views/secondary_title.dart';
import 'package:itcm_site/data/constants.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../helpers/navigation_helper.dart';
import '../../shared_views/main_title.dart';
import '../../shared_views/shared_views.dart';
import '../../toolbar/drawer/drawer_custom.dart';
import '../../toolbar/toolbar_custom.dart';

class BuildingPage extends StatefulWidget {
  BuildingPage() {
    selectedRout = BUILDING_ROUT;
  }
  _BuildingPage createState() => _BuildingPage();
}

class _BuildingPage extends State<BuildingPage> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  final String _recommendationImagePath = 'assets/images/recommendation_graph.jpg';
  final String _exampleOneImagePath = 'assets/images/example_1.jpeg';
  final String _exampleTwoImagePath = 'assets/images/example_2.jpeg';
  final _description =
      'כלל ראשון אם לא יהיה כדאיות כלכלית - רווח ליזם שאחראי למימון הפרויקט, הפרויקט לא יצא לפועל.\n\nאם הרווח ליזם יהיה נמוך הוא ינסה לחסוך בביצוע שיגרום לכשלים בפרויקט.\n\nמתוך ניסיון בפיקוח וביצוע חוות דעת על עבודות בפרויקט תמ"א בכל שלבי הפרויקט העדיפות היא פינוי בינוי.\n\nחברת ביטנגוס משמשת בגורם המבצעה פיקוח מטעם הדיירים והן מטעם היזם.\n\nהתפקיד שלנו בחברת ביטנגוס היא לוודא כי הפרויקט מתנהל לפי התוכניות.\n\nלהתריע על כשלים בזמן לכל הצדדים.\n\nהמטרה שלנו שהפרויקט יצליח והדיירים יקבלו את הדירות שלהם לפי ההתחייבות של היזם.';
  final _textNearImage =
      'לבחור חברת פיקוח נטרלי לפני כניסה למשא ומתן עם יזם. חברת פיקוח המורכבת ממהנדסים תדע תמיד להציג דרישות ליזם שוועד הבית או הדיירים לא מודעים לזכויות או לדרישות הנדסיות בנושאים כגון: איטום, אינסטלציה, אלומיניום, חשמל, מערכות לכיבוי אש, מעליות ועוד...';

  @override
  Widget build(BuildContext context) {
    log('$TAG_CHECK_LIFECYCLE HomeView{} -> build()');
    return ResponsiveBuilder(builder: (context, sizingInformation) {
      setScreenSizes(context, sizingInformation.deviceScreenType);
      return Scaffold(
        endDrawer: sizingInformation.deviceScreenType == DeviceScreenType.mobile ? DrawerCustom(scaffoldKey) : null,
        key: scaffoldKey,
        body: RefreshIndicator(onRefresh: _pullToRefresh, child: _mainWidget(context)),
      );
    });
  }

  Widget _mainWidget(BuildContext context) {
    return Column(
      children: [
        ToolbarCustom(scaffoldKey),
        Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: <Widget>[
                MainTitle(),
                SecondaryTitle('פינוי בינוי או תוספת לבניין הקיים'),
                CenteredWidget(
                    centeredWidget: getTextWidget(_description, fontFamily: lucidaSansFontFamily, fontWeight: FontWeight.w500, fontSize: 22), paddingVertical: 40),
                getTextNearImageWidget(context, _recommendationImagePath, _textNearImageMainWidget, imageHeight: 320),
                SizedBox(height: 70, width: 70),
                SecondaryTitle('דוגמאות לכשלים כתוצאה מחוסר פיקוח שהתגלו לאחר סיום הבניה.'),
                widgetsOrganizer([
                  getImageWithText('כשלים באיטום שלא נראים לאחר ביצוע', _exampleOneImagePath, 450),
                  getImageWithText('כשל בחיבור שני צינורות', _exampleTwoImagePath, 450)
                ]),
                contactUsBtnArea(context),
                BottomLine(),
              ],
            ),
          ),
        ),
      ],
    );
  }

  get _textNearImageMainWidget => Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          getTextWidget('המלצות:', fontFamily: lucidaSansFontFamily, fontWeight: FontWeight.w700, fontSize: 22),
          getTextWidget(_textNearImage, fontFamily: lucidaSansFontFamily, fontWeight: FontWeight.w500, fontSize: 22),
        ],
      );

  Future _pullToRefresh() async => setState(() {});
}
