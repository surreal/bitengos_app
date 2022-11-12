import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:itcm_site/pages/build_it_page/build_it_page.dart';
import 'package:itcm_site/pages/building_page/building_page.dart';
import 'package:itcm_site/pages/contact_page/contact_page.dart';
import 'package:itcm_site/pages/home_page/home_page.dart';
import 'package:itcm_site/data/constants.dart';

// Route<dynamic> generateRoute(RouteSettings settings) {
//   switch (settings.name) {
//     case HomeRoute:
//       return _getPageRoute(HomePage(), settings);
//     default:
//       return null;
//   }
// }

Route<dynamic> generateRoute(RouteSettings settings) {
  log('$TAG_CHECK_SEQUENCE generateRoute() -> route: ${settings.name}');
  switch (settings.name) {
    case HOME_ROUTE:
      return _getPageRoute(HomePage(), settings);
    case BUILDING_ROUT:
      return _getPageRoute(BuildingPage(), settings);
    case BUILD_IT_ROUT:
      return _getPageRoute(BuildItPage(), settings);
    case CONTACT_ROUT:
      return _getPageRoute(ContactPage(), settings);
    default:
      return _getPageRoute(HomePage(), settings);
  }
}

PageRoute _getPageRoute(Widget child, RouteSettings settings) {
  return _FadeRoute(child: child, routeName: settings.name);
}

class _FadeRoute extends PageRouteBuilder {
  final Widget child;
  final String routeName;
  _FadeRoute({this.child, this.routeName})
      : super(
          settings: RouteSettings(name: routeName),
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              child,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              FadeTransition(
            opacity: animation,
            child: child,
          ),
        );
}
