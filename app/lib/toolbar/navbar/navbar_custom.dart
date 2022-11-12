import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:itcm_site/models/toolbar_model.dart';
import 'package:itcm_site/shared_views/shared_views.dart';
import 'package:itcm_site/data/arrays.dart';
import 'package:itcm_site/data/constants.dart';

import '../../helpers/navigation_helper.dart';
import '../../pressors/pressor_widget_not_animated.dart';
import '../../shared_views/logo_area.dart';
import '../toolbar_item.dart';

class NavbarCustom extends StatefulWidget {
  const NavbarCustom({Key key}) : super(key: key);
  static _NavbarCustomState of(BuildContext context) => context.findAncestorStateOfType<_NavbarCustomState>();
  _NavbarCustomState createState() => _NavbarCustomState();
}

class _NavbarCustomState extends State<NavbarCustom> {
  onTapAction([int position]) {
    String routBefore = selectedRout;
    selectedRout = routByPosition.values.elementAt(position);
    log('$TAG_CHECK_SEQUENCE onTapAction() -> position: $position; selectedRout: $selectedRout');
    routTo(context, selectedRout, onResume: () {
      setState(() {});
      selectedRout = routBefore;
    });
    setState(() {});
  }

  Widget getItem(int position, String rout, String title) {
    return PressorWidgetNotAnimated(
      ToolbarItem(
        ToolbarModel(
          title: title,
          navigationPath: rout,
          iconData: null,
          isSelected: selectedRout == rout,
        ),
      ),
      onTapAction,
      position,
    );
  }

  @override
  Widget build(BuildContext context) {
    log('checkSelection -> build() selectedRout == ' + selectedRout);
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        Container(
          height: 80,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              NavBarLogo(),
              Row(
                children: <Widget>[
                  getItem(3, CONTACT_ROUT, 'צור קשר'),
                  getItem(2, BUILD_IT_ROUT, 'Build it'),
                  getItem(1, BUILDING_ROUT, 'תמ"א 38'),
                  getItem(0, HOME_ROUTE, 'בית'),
                ],
              )
            ],
          ),
        ),
        breakLine(context),
      ],
    );
  }
}
