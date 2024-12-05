import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

extension ListStringExtensions on List<String> {
  List<Text> get toWidget {
    List<Text> children = [];
    for (var item in this) {
      children.add(Text(
        item,
        textAlign: TextAlign.center,
        style: const TextStyle(color: AppColors.darkNavyColor),
      ));
    }
    return children;
  }

  List<Text> get toIndexWidget {
    List<Text> children = [];
    asMap().keys.map((index) {
      children.add(Text((index + 1).toString()));
    }).toList();
    return children;
  }
}
