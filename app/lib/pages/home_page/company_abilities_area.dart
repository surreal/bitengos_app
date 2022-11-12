import 'package:flutter/material.dart';
import 'package:itcm_site/design/app_colors.dart';
import 'package:itcm_site/shared_views/secondary_title.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:itcm_site/design/app_fonts.dart';

class CompanyAbilities extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        bool _isForDesktopView = sizingInformation.deviceScreenType == DeviceScreenType.desktop;
        return Column(
          children: [
            SecondaryTitle('השירותים שלנו'),
            Container(
              color: greyColor,
              child: Padding(
                padding: const EdgeInsets.all(40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    _isForDesktopView ? _desktopScheme : _mobileScheme,
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  List<Widget> _getTopThree() {
    List<Widget> list = [
      _itemWidget('assets/images/line_chart.png', 'תכנון הנדסי', 'יעוץ, תכנון, פיקוח וניהול פרויקטים'),
      _itemWidget('assets/images/stats.png', 'תכנון אדריכלי', 'הכנת תוכניות: הריסה, בניה, חשמל, אינסטלציה'),
      _itemWidget('assets/images/news.png', 'בדק בית', 'ביצוע בדק בית לפני רכישה מתן חוות דעת הנדסית לבית משפט יעוץ הנדסי')
    ];
    return list;
  }

  List<Widget> _getBottomThree() {
    List<Widget> list = [
      _itemWidget('assets/images/laptop.png', 'שמאות רכוש ונדל"ן', 'ביצוע שמאות לנזקים, נכסים, רכוש, חוות דעת המאושרת לבתי משפט'),
      _itemWidget('assets/images/target.png', 'איתור נזילות', 'איתור נזילה והכנת אומדן נזקים להגשה לבית משפט כולל תהליך הגשה לתביעה לבית משפט'),
      _itemWidget('assets/images/world_grid.png', 'בדיקת קרינה', 'ביצוע וניהול פרויקטים')
    ];
    return list;
  }

  List<Widget> _getAllSix() {
    List<Widget> list = _getTopThree();
    list.addAll(_getBottomThree());
    return list;
  }

  Widget _itemWidget(String imagePath, String title, String description) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                SelectableText(
                  title,
                  style: TextStyle(fontFamily: micSansFontFamily, fontSize: 18, fontWeight: FontWeight.w700),
                  textAlign: TextAlign.right,
                ),
                SizedBox(height: 10),
                SizedBox(
                  width: 200,
                  child: SelectableText(
                    description,
                    style: TextStyle(fontFamily: davidFontFamily, fontSize: 18, fontWeight: FontWeight.w200),
                    textAlign: TextAlign.right,
                  ),
                ),
              ],
            ),
            SizedBox(width: 30, height: 30),
            Image(
              width: 40,
              fit: BoxFit.fill,
              image: AssetImage(imagePath),
            ),
          ],
        ),
        SizedBox(width: 30, height: 30),
      ],
    );
  }

  Widget get _desktopScheme => Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: _getTopThree(),
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: _getBottomThree(),
          ),
        ],
      );

  Widget get _mobileScheme => Column(crossAxisAlignment: CrossAxisAlignment.end, children: _getAllSix());
}
