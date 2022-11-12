import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:itcm_site/extensions/hover_extensions.dart';

import '../design/app_colors.dart';

class PressorWidgetAnimated extends StatefulWidget {
  final int _position;
  final Widget _widgetPassed;
  final Function([int]) _func;
  PressorWidgetAnimated(this._widgetPassed, this._func, [this._position]);
  _PressorWidgetAnimatedState createState() => _PressorWidgetAnimatedState();
}

class _PressorWidgetAnimatedState extends State<PressorWidgetAnimated> {
  bool isPressed = false;
  @override
  Widget build(BuildContext context) {
    log('checkButtonSimple -> _SelectorCustom{} build()');
    return GestureDetector(
      onTap: () {
        // widget._func(widget._position);
        isPressed = true;
        setState(() {});
        Timer(Duration(milliseconds: 150), () {
          isPressed = false;
          widget._func(widget._position);
          setState(() {});
        });
      },
      child: AnimatedContainer(
        padding: EdgeInsets.all(10),
        // width: double.infinity,
        alignment: Alignment.center,
        duration: Duration(milliseconds: 150),
        color: isPressed ? greyColor : whiteColor,
        // decoration: getOvalDecoration(isPressed ? greyColor : whiteColor, blueColor),
        child: widget._widgetPassed,
      ),
    ).showCursorOnHover;
  }
}
