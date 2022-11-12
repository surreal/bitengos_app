import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:itcm_site/models/toolbar_model.dart';
import 'package:itcm_site/pressors/pressor_widget_animated.dart';
import 'package:itcm_site/toolbar/toolbar_item.dart';
import 'package:itcm_site/data/arrays.dart';

import '../../helpers/navigation_helper.dart';
import '../../data/constants.dart';

class DrawerCustom extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  DrawerCustom(this.scaffoldKey);
  _DrawerCustomState createState() => _DrawerCustomState();
}

class _DrawerCustomState extends State<DrawerCustom> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 16)],
      ),
      child: Column(
        children: <Widget>[
          SizedBox(height: 20),
          // NavigationDrawerHeader(),
          _itemWidget('בית', HOME_ROUTE, 0, Icons.home),
          _itemWidget('תמ"א 38', BUILDING_ROUT, 1, Icons.account_balance_wallet_rounded),
          _itemWidget('Build it', BUILD_IT_ROUT, 2, Icons.account_balance),
          _itemWidget('צור קשר', CONTACT_ROUT, 3, Icons.contact_mail_rounded),
        ],
      ),
    );
  }

  Widget _itemWidget(String title, String route, int position, IconData iconData) => PressorWidgetAnimated(
      ToolbarItem(ToolbarModel(title: title, navigationPath: route, iconData: iconData, isSelected: selectedRout == route)), _onTapAction, position);

  _onTapAction([int position]) {
    log('checkSelection -> tapped()');
    String routBefore = selectedRout;
    selectedRout = routByPosition.values.elementAt(position);
    log('$TAG_CHECK_SEQUENCE navigation_drawer -> onTapAction() selectedRout: $selectedRout');
    setState(() {});
    Timer(Duration(milliseconds: 100), () {
      log('checkSelection -> Timer -> setState()');
      routTo(context, selectedRout, onResume: () => selectedRout = routBefore);
      widget.scaffoldKey.currentState.closeEndDrawer();
      // closeActiveWidget(context);
      setState(() {});
    });
  }

  @override
  void dispose() {
    log('checkDrawer -> dispose()');
    // closeEndDrawer(context);
    // Navigator.of(context).dispose();
    super.dispose();
  }
}
