import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:itcm_site/helpers/rout_helper.dart';
import 'package:itcm_site/toolbar/drawer/drawer_custom.dart';
import 'package:itcm_site/data/constants.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'helpers/orientation_helper.dart';
import 'helpers/navigation_helper.dart';

class MainView extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  MainView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        setScreenSizes(context, sizingInformation.deviceScreenType);
        log('checkScreenWidth -> screenWidth == ' + screenWidth.toString() + '; sizeOf == ' + screenSizeType.toString());
        log('$TAG_CHECK_SEQUENCE main_view -> build() selectedRout: $selectedRout');

        return Scaffold(
          endDrawer: sizingInformation.deviceScreenType == DeviceScreenType.mobile ? DrawerCustom(scaffoldKey) : null,
          key: scaffoldKey,
          backgroundColor: Colors.white,
          body: Container(
            child: Column(
              children: <Widget>[
                // NavigationBarCustom(),
                Expanded(
                  child: Navigator(
                    // pages: [MaterialPage(child: BuildingPage())],
                    // onPopPage: (rout, result) {
                    //   log('onPopPage -> result == ' + result);
                    //   return rout.didPop(result);
                    // },
                    key: locator<NavigationHelper>().navigatorKey,
                    onGenerateRoute: generateRoute,
                    initialRoute: selectedRout,
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
