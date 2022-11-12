import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:itcm_site/pages/home_page/about_area.dart';
import 'package:itcm_site/pages/home_page/company_abilities_area.dart';
import 'package:itcm_site/pages/home_page/company_details_area.dart';
import 'package:itcm_site/design/app_colors.dart';
import 'package:itcm_site/shared_views/bottom_line.dart';
import 'package:itcm_site/data/constants.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../helpers/navigation_helper.dart';
import '../../helpers/orientation_helper.dart';
import '../../shared_views/main_title.dart';
import '../../shared_views/shared_views.dart';
import '../../toolbar/drawer/drawer_custom.dart';
import '../../toolbar/toolbar_custom.dart';

class HomePage extends StatefulWidget {
  HomePage() {
    selectedRout = HOME_ROUTE;
  }
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    log('$TAG_CHECK_LIFECYCLE HomeView{} -> build()');
    return ResponsiveBuilder(builder: (context, sizingInformation) {
      setScreenSizes(context, sizingInformation.deviceScreenType);
      return Scaffold(
        endDrawer: sizingInformation.deviceScreenType == DeviceScreenType.mobile ? DrawerCustom(scaffoldKey) : null,
        key: scaffoldKey,
        body: RefreshIndicator(
          onRefresh: _pullRefresh,
          child: _getHomeContent(context),
        ),
      );
    });
  }

  Widget _getHomeContent(BuildContext context) {
    return Column(
      children: [
        ToolbarCustom(scaffoldKey),
        Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: <Widget>[
                MainTitle(),
                AboutView(),
                CompanyDetails(),
                Container(height: 2, color: blueColor),
                CompanyAbilities(),
                // AllProductsArea(),
                // ContactUs(),
                contactUsBtnArea(context),
                BottomLine()
              ],
            ),
          ),
        ),
      ],
    );
  }

  Future _pullRefresh() async => setState(() {});
}
