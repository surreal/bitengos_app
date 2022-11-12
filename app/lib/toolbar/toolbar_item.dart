import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:itcm_site/models/toolbar_model.dart';
import 'package:itcm_site/extensions/hover_extensions.dart';

import 'navbar/navbar_item.dart';
import 'drawer/drawer_item.dart';

class ToolbarItem extends StatelessWidget {
  final ToolbarModel model;
  ToolbarItem(this.model); // bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    // log('checkSelection -> build()');
    return Provider.value(
      value: model,
      child: ScreenTypeLayout(
        desktop: NavBarItem(),
        tablet: NavBarItem(),
        mobile: DrawerItem(),
      ).showCursorOnHover.moveUpOnHover,
    );
  }
}
