import 'package:flutter/material.dart';
import 'package:itcm_site/design/app_colors.dart';
import 'package:itcm_site/design/app_fonts.dart';

import '../helpers/orientation_helper.dart';

class MainTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Image(
              height: 100,
              width: setGetScreenWidth(context),
              fit: BoxFit.fill,
              image: AssetImage('assets/images/abstract_grey_lines.jpg'),
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 5),
                  // margin: EdgeInsets.all(10),
                  // height: 70,
                  width: 380,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(35), color: greyTransColor, border: Border.all(color: blueColor, width: 4)),
                  child: SelectableText(
                    'ביטנגוס הבית לשירותי הנדסת בניין',
                    textDirection: TextDirection.rtl,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 22, color: blackColor, fontFamily: aharoniFontFamily, fontWeight: FontWeight.normal),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
