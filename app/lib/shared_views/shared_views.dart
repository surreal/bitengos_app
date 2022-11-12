import 'dart:developer';

import 'package:flutter/cupertino.dart';

import '../design/app_colors.dart';
import '../helpers/orientation_helper.dart';
import '../helpers/navigation_helper.dart';
import '../pressors/pressor_button.dart';
import '../data/constants.dart';

Widget breakLine(BuildContext context) => Container(
      // alignment: Alignment.bottomCenter,
      color: blueColor,
      width: setGetScreenWidth(context),
      height: 2,
    );

Widget contactUsBtnArea(BuildContext context) => Column(children: [
      breakLine(context),
      Container(
          color: greyColor,
          padding: EdgeInsets.all(20),
          child: PressorButton('לפרטים נוספים צור קשר', () {
            log('$TAG_ON_TAP  contactUsBtnArea() -> PRESSED');
            String routBefore = selectedRout;
            selectedRout = CONTACT_ROUT;
            routTo(context, CONTACT_ROUT, onResume: () => selectedRout = routBefore);
          }))
    ]);
