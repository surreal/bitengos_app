import 'package:flutter/widgets.dart';

class ToolbarModel extends State {
  String title;
  final String navigationPath;
  final IconData iconData;
  bool isSelected = false;

  ToolbarModel({this.title, this.navigationPath, this.iconData, this.isSelected});

  void setSelected(bool isSelected) {
    this.isSelected = isSelected;
  }

  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }
}
