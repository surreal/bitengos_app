import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:itcm_site/design/app_fonts.dart';
import 'package:itcm_site/pages/build_it_page/build_it_page.dart';
import 'package:itcm_site/pages/building_page/building_page.dart';
import 'package:itcm_site/pages/contact_page/contact_page.dart';
import 'package:itcm_site/pages/home_page/home_page.dart';

import 'data/constants.dart';
import 'helpers/navigation_helper.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    log("checkLifeCycle main -> myApp()");
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bitengos',
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        BUILD_IT_ROUT: (context) => BuildItPage(),
        BUILDING_ROUT: (context) => BuildingPage(),
        CONTACT_ROUT: (context) => ContactPage(),
        // AuthenticationRout: (context) => AuthenticationPage(),
        // TermsOfUseRout: (context) => TermsOrAbout(true),
        // HomeRoute: (context) => HomePage(),
        // QuestionsRout: (context) => QuestionsPage()
      },
      theme: ThemeData(
          // primarySwatch: Colors.green,
          textTheme: Theme.of(context).textTheme.apply(fontFamily: lucidaSansFontFamily)),
      // home: MainView(),
    );
  }
}
