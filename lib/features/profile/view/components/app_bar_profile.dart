import 'package:delivery_app/core/Extensions/space_extension.dart';
import 'package:delivery_app/core/Extensions/string_extensions.dart';
import 'package:delivery_app/core/Extensions/widget.extenstion.dart';
import 'package:delivery_app/core/clipper/custom_clipper3.dart';
import 'package:delivery_app/core/constants/app_colors.dart';
import 'package:delivery_app/core/constants/json_constants.dart';
import 'package:delivery_app/core/constants/styles_constants.dart';
import 'package:delivery_app/features/profile/view/components/user_avatar.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../core/functions/functions.dart';


class AppBarProfile extends StatelessWidget {
  const AppBarProfile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        ClipPath
        (
          clipper: CustomCurveClipper3(),
          child: Container
          (
              width: double.infinity,
              height: 200,
              decoration: const BoxDecoration(
                gradient: LinearGradient(colors: AppColors.yellowGradient),
              ),
              child: null
          ),
        ),
        const Positioned(
          bottom: -40,
          left: 0,
          right: 0,
          child: UserAvatar(),
        ),
        AppBar
        (
          centerTitle: false,
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          title: Column(
            children: [
              16.spaceH,
              Row(
                children: 
                [
                  IconButton(
                    onPressed: () { Functions().showSettingsDialog(context); },
                    icon: const Icon(Iconsax.menu_1,
                        color: AppColors.blueColor),
                    iconSize: 32,
                  ),
                  Text
                  (
                    JsonConstants.myProfile.t(context),
                    style: StylesConsts.darkTextLg.copyWith(color: AppColors.blueColor),
                  ).horizontalPadding,
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
