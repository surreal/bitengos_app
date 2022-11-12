import 'package:flutter/material.dart';

import '../helpers/orientation_helper.dart';

class BottomLine extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 30,
        padding: EdgeInsets.all(8.0),
        alignment: Alignment.bottomCenter,
        width: setGetScreenWidth(context),
        color: Colors.black,
        child: Text(
          '© Bitengos™ - כל הזכויות שמורות',
          style: TextStyle(color: Colors.white, fontSize: 10),
        ),
      ),
    );
  }
}
