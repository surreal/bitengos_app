import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../data/constants.dart';

String selectedRout = HOME_ROUTE;
GetIt locator = GetIt.instance;

void setupLocator() => locator.registerLazySingleton(() => NavigationHelper());

void openDrawer(GlobalKey<ScaffoldState> scaffoldKey) => scaffoldKey.currentState.openEndDrawer();
void closeDrawer(GlobalKey<ScaffoldState> scaffoldKey) => scaffoldKey.currentState.closeEndDrawer();

void closeActiveWidget(BuildContext context, [bool rootNavigator]) => Navigator.of(context, rootNavigator: rootNavigator != null).pop();

routTo(BuildContext context, String route, {Function() onResume}) => Navigator.of(context).pushNamed(route).then((value) => onResume());
// routTo(String rout) => locator<NavigationHelper>().navigateTo(rout);

class NavigationHelper {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  // Future<dynamic> navigateTo(String routeName) => navigatorKey.currentState.pushNamed(routeName);

  void goBack() => navigatorKey.currentState.pop();
}
