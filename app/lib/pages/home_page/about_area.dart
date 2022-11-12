import 'package:flutter/material.dart';
import 'package:itcm_site/design/app_colors.dart';
import 'package:itcm_site/helpers/text_helper.dart';
import 'package:itcm_site/shared_views/secondary_title.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:itcm_site/design/app_fonts.dart';

import '../../helpers/centered_widget.dart';

class AboutView extends StatelessWidget {
  final String _imagePath = 'assets/images/worker_graph.jpg';
  final String _titleAbout = 'חברת ביטנגוס מורכבת ממהנדסי בניין עם ניסיון בתכנון, יעוץ, ניהול ופיקוח.';
  final String _textAbout =
      'ביטנגוס הנדסה מספקת מגוון רחב של שירותים בתחום הנדסת הבניין. הצוות שלנו מורכב ממהנדסים, שמאים, מתכננים עם ניסיון של שנים אשר מבינים את הצרכים של הלקוחות ועוזרים ללקוחות באופן אישי עם ערכים של יושרה, שקיפות, אמינות בשילוב קידמה וטכנולוגיות שגורמות ללקוח להרגיש שהוא עם צוות מנצח.';

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) => Container(
        padding: EdgeInsets.only(bottom: 20),
        color: whiteColor,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          // crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SecondaryTitle('אודות החברה'),
            textWithTitle,
            getTextNearImageWidget(context, _imagePath, _textNearImageMainWidget),
          ],
        ),
      ),
    );
  }

  Widget get textWithTitle => CenteredWidget(
        centeredWidget: Column(
          children: [
            getTextWidget(_titleAbout, fontFamily: lucidaSansFontFamily, fontWeight: FontWeight.w700, fontSize: 22),
            SizedBox(height: 20),
            getTextWidget(_textAbout, fontFamily: lucidaSansFontFamily, fontWeight: FontWeight.w500, fontSize: 22),
          ],
        ),
        paddingVertical: 40,
      );

  get _textNearImageMainWidget => Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          getTextWidget('ביטנגוס הנדסה מתמחה:', fontFamily: lucidaSansFontFamily, fontWeight: FontWeight.w700, fontSize: 22),
          SizedBox(height: 10),
          getTextWithDotWidget('מתן חוות דעת למבנים עם צווי סכנה או מבנים עם כשלים הנדסיים.'),
          getTextWithDotWidget('תכנון הנדסי: מבנים, נגישות למבנים, מרפסות.'),
          getTextWithDotWidget('שמאות מקרקעין ורכוש.'),
          getTextWithDotWidget('בדק בית לקבלנים ופרטיים.'),
          getTextWithDotWidget('ייצוג בית משפט.'),
          getTextWithDotWidget('פיקוח וניהול פרויקטים הנדסיים, תכנון ועיצוב אדריכלי.'),
          getTextWithDotWidget('יעוץ משפטי.'),
        ],
      );
}
