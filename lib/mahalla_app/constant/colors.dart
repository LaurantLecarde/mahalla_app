import 'package:flutter/material.dart';

class AppColors {
  static Color appColor = const Color(0xff246bfb);
}
mainTheme(BuildContext context){
  Color mainTheme = Theme.of(context).primaryColor;
  return mainTheme;
}