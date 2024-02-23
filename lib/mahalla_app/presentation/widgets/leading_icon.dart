import 'package:flutter/material.dart';
import 'package:mahalla_app/mahalla_app/constant/navigations.dart';

leadingIcon(BuildContext context) {
  return IconButton(
      onPressed: () => navigatePop(context),
      icon: const Icon(Icons.keyboard_backspace_outlined,size: 35));
}

