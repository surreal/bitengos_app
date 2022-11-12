import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:itcm_site/data/constants.dart';
import 'package:responsive_builder/responsive_builder.dart';

class CenteredWidget extends StatelessWidget {
  final Widget centeredWidget;
  final double paddingVertical;
  const CenteredWidget({this.centeredWidget, this.paddingVertical});

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        log('$TAG_CHECK_VALUES sizingInformation: ${sizingInformation.deviceScreenType}');
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: paddingVertical == null ? 0 : paddingVertical),
          alignment: Alignment.topCenter,
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 1080),
            child: centeredWidget,
          ),
        );
      },
    );
  }
}
