import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:itcm_site/shared_views/shared_views.dart';

import '../helpers/navigation_helper.dart';
import '../shared_views/logo_area.dart';

class HamburgerButton extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  const HamburgerButton(this.scaffoldKey, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        Container(
          height: 80,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              NavBarLogo(),
              IconButton(
                padding: EdgeInsets.only(right: 20),
                icon: Icon(Icons.menu),
                onPressed: () {
                  openDrawer(scaffoldKey);
                  log('checkDrawer -> hamburg button onPressed()');
                },
              ),
            ],
          ),
        ),
        breakLine(context),
      ],
    );
  }
}
