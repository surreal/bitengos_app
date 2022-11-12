import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'hamburger_button.dart';
import 'navbar/navbar_custom.dart';

class ToolbarCustom extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  const ToolbarCustom(this.scaffoldKey, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: HamburgerButton(scaffoldKey),
      tablet: NavbarCustom(),
      desktop: NavbarCustom(),
    );
  }
}
