
import 'package:delivery_app/core/Extensions/context_extension.dart';
import 'package:delivery_app/core/Extensions/space_extension.dart';
import 'package:delivery_app/core/Extensions/string_extensions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../core/constants/json_constants.dart';
import '../../../auth/view/components/custom_text_form_field.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({
    super.key, this.color, this.onTap, required this.controller,
  });
  final Color? color;
  final TextEditingController controller;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Row
    (
      children: 
      [
        Expanded
        (
          child: CustomTextFromField
          (
            label: JsonConstants.search.t(context), 
            controller: controller, 
            type: TextInputType.text
          ),
        ),
        8.spaceW,
        InkWell
        (
          onTap: onTap,
          child: CircleAvatar
          (
            radius: 24,
            backgroundColor: color ?? context.colorScheme.secondary.withOpacity(.8),
            child: const Icon(Iconsax.search_normal)
          ),
        )
      ],
    );
  }
}