import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:itcm_site/extensions/hover_extensions.dart';

class PressorWidgetNotAnimated extends StatefulWidget {
  final int _position;
  final Widget _widgetPassed;
  final Function([int]) _func;
  PressorWidgetNotAnimated(this._widgetPassed, this._func, [this._position]);
  _PressorWidgetNotAnimatedState createState() => _PressorWidgetNotAnimatedState();
}

class _PressorWidgetNotAnimatedState extends State<PressorWidgetNotAnimated> {
  @override
  Widget build(BuildContext context) {
    log('checkButtonSimple -> _SelectorCustom{} build()');
    return GestureDetector(
      onTap: () => widget._func(widget._position),
      child: AnimatedContainer(
        padding: EdgeInsets.all(10),
        // width: double.infinity,
        alignment: Alignment.center,
        duration: Duration(milliseconds: 100),
        // color: isPressed ? greyColor : whiteColor,
        // decoration: getOvalDecoration(isPressed ? greyColor : whiteColor, blueColor),
        child: widget._widgetPassed,
      ),
    ).showCursorOnHover;
  }
}
