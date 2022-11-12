import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:itcm_site/extensions/hover_extensions.dart';

import '../design/app_colors.dart';
import '../design/app_style.dart';

class PressorButton extends StatefulWidget {
  final String _titleStringKey;
  final Function() _func;
  final int _width;
  PressorButton(this._titleStringKey, this._func, [this._width]);
  _PressorButtonState createState() => _PressorButtonState();
}

class _PressorButtonState extends State<PressorButton> {
  bool isPressed = false;
  @override
  Widget build(BuildContext context) {
    log('checkButtonSimple -> _SelectorCustom{} build()');
    return GestureDetector(
      onTap: () {
        isPressed = true;
        setState(() {});
        Timer(Duration(milliseconds: 200), () {
          isPressed = false;
          setState(() {});
          widget._func();
        });
      },
      child: AnimatedContainer(
        padding: EdgeInsets.all(8),
        width: widget._width == null ? double.infinity : widget._width,
        alignment: Alignment.center,
        duration: Duration(milliseconds: 150),
        // color: isPressed ? blueLightColor : whiteTransparentColorPrimary,
        decoration: getOvalDecoration(isPressed ? greyColor : whiteColor, blueColor),
        child: Text(
          widget._titleStringKey,
          style: getButtonTextStyle(),
        ),
      ),
    ).showCursorOnHover;
  }
}
