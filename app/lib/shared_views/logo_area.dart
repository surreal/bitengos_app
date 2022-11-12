import 'package:flutter/material.dart';

class NavBarLogo extends StatelessWidget {
  // const NavBarLogo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: 120,
      width: 80,
      child: Padding(padding: EdgeInsets.only(left: 20, top: 10, bottom: 10), child: Image.asset('assets/images/logo.png')),
    );
  }
}
