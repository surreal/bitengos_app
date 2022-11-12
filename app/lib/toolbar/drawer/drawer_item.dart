import 'package:flutter/material.dart';
import 'package:itcm_site/design/app_colors.dart';
import 'package:stacked/stacked.dart';
import 'package:itcm_site/models/toolbar_model.dart';

class DrawerItem extends ViewModelWidget<ToolbarModel> {
  @override
  Widget build(BuildContext context, ToolbarModel model) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Icon(model.iconData),
          Text(
            model.title,
            style: TextStyle(
              fontSize: 25,
              color: model.isSelected ? blueAccentColor : blackColor,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
