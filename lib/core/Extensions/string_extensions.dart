import 'package:flutter/material.dart';

import '../localization/app_localization.dart';

extension StringExtension on String? {
  //translate
  String t(BuildContext context) {
    return AppLocalizations.of(context)?.translate(this!) ?? '';
  }
}