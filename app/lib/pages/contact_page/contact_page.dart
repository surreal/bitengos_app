import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:itcm_site/helpers/orientation_helper.dart';
import 'package:itcm_site/data/constants.dart';
import 'package:itcm_site/shared_views/bottom_line.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../helpers/navigation_helper.dart';
import '../../shared_views/main_title.dart';
import '../../toolbar/drawer/drawer_custom.dart';
import '../../toolbar/toolbar_custom.dart';
import 'contact_us_area.dart';

class ContactPage extends StatefulWidget {
  ContactPage() {
    selectedRout = CONTACT_ROUT;
  }
  _ContactPage createState() => _ContactPage();
}

class _ContactPage extends State<ContactPage> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    log('$TAG_CHECK_LIFECYCLE HomeView{} -> build()');
    return ResponsiveBuilder(builder: (context, sizingInformation) {
      setScreenSizes(context, sizingInformation.deviceScreenType);
      return Scaffold(
        endDrawer: sizingInformation.deviceScreenType == DeviceScreenType.mobile ? DrawerCustom(scaffoldKey) : null,
        key: scaffoldKey,
        body: RefreshIndicator(onRefresh: _pullToRefresh, child: _mainWidget(context)),
        // body: ScreenTypeLayout(
        //   mobile: getHomeContent(context),
        //   desktop: getHomeContent(context),
        // ),
      );
    });
  }

  Widget _mainWidget(BuildContext context) {
    return Column(
      children: [
        ToolbarCustom(scaffoldKey),
        Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: <Widget>[
                MainTitle(),
                ContactUs(),
                BottomLine(),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Future _pullToRefresh() async => setState(() {});
}
