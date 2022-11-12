import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:itcm_site/design/app_colors.dart';
import 'package:itcm_site/design/app_fonts.dart';
import 'package:itcm_site/data/constants.dart';

class SecondaryTitle extends StatefulWidget {
  final String _title;
  SecondaryTitle(this._title);
  _SecondaryTitleState createState() => _SecondaryTitleState();
}

class _SecondaryTitleState extends State<SecondaryTitle> with SingleTickerProviderStateMixin {
  Animation<double> _textEnlargeAnimation;
  AnimationController _animationController;

  @override
  Widget build(BuildContext context) {
    log('$TAG_CHECK_LIFECYCLE SecondaryTitle{} -> build()');
    return Container(
      color: blueColor,
      child: Align(
        alignment: Alignment.centerRight,
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, bottom: 5, top: 5),
          child: SelectableText(
            widget._title,
            textDirection: TextDirection.rtl,
            style: TextStyle(
              fontFamily: micSansFontFamily,
              // fontSize: textEnlargeAnimation.value,
              fontSize: 18,
              fontWeight: FontWeight.w900,
              color: blackColor,
            ),
          ),
        ),
      ),
    );
  }

  _setTextEnlargeAnimation() {
    _animationController = AnimationController(duration: const Duration(milliseconds: 800), vsync: this);
    _textEnlargeAnimation = Tween(begin: 0.0, end: 22.0).animate(_animationController)..addListener(() => setState(() {}));
    _animationController.forward();
  }

  @override
  void dispose() {
    // _animationController.dispose();
    super.dispose();
    log('$TAG_CHECK_VALUES -> SecondaryTitle{} -> dispose()');
  }
}
