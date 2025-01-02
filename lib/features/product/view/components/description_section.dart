import 'package:delivery_app/core/Extensions/space_extension.dart';
import 'package:delivery_app/core/Extensions/string_extensions.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/json_constants.dart';
import '../../../../core/constants/styles_constants.dart';

class DescriptionSection extends StatelessWidget {
  const DescriptionSection({super.key, required this.description});
  final String? description;

  @override
  Widget build(BuildContext context) 
  {
    return Column
    (
      crossAxisAlignment: CrossAxisAlignment.start,
      children: 
      [
        Text
        (
          JsonConstants.description.t(context),
          style: StylesConsts.whiteTextXs.copyWith(color: AppColors.blackColor),
        ),
        8.spaceH,
        Text
        (
          description ?? '',
          style: StylesConsts.yellowTextXs.copyWith(color: Colors.grey[600],),
          softWrap: true,
        ),
      ],
    );
  }
}