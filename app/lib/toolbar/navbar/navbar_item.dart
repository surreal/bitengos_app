import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:itcm_site/design/app_colors.dart';
import 'package:stacked/stacked.dart';
import 'package:itcm_site/models/toolbar_model.dart';

class NavBarItem extends ViewModelWidget<ToolbarModel> {
  @override
  Widget build(BuildContext context, ToolbarModel model) {
    log("checkSelection -> NavBarItemTabletDesktop -> model.isSelected == " + model.isSelected.toString() + '; model.title == ' + model.title);
    return Text(
      model.title,
      style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: model.isSelected ? blueAccentColor : Colors.black87),
    );
  }
}
