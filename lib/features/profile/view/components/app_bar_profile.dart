import 'package:delivery_app/core/Extensions/context_extension.dart';
import 'package:delivery_app/core/Extensions/space_extension.dart';
import 'package:delivery_app/core/Extensions/string_extensions.dart';
import 'package:delivery_app/core/constants/app_colors.dart';
import 'package:delivery_app/core/constants/json_constants.dart';
import 'package:delivery_app/core/constants/styles_constants.dart';
import 'package:delivery_app/features/profile/view/components/user_avatar.dart';
import 'package:flutter/material.dart';

class AppBarProfile extends StatelessWidget {
  const AppBarProfile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
            width: double.infinity,
            height: 200,
            decoration: const BoxDecoration(
              color: AppColors.yellowColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40),
              ),
            ),
            child: null),
        Positioned(
            top: 40,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () { context.pop();},
                    icon: const Icon(Icons.arrow_back,
                        color: AppColors.blueColor),
                    iconSize: 24,
                  ),
                  55.spaceW,
                  Center(
                    child: Text(JsonConstants.myProfile.t(context),
                        style: StylesConsts.titleText
                            .copyWith(color: AppColors.blueColor)),
                  ),
                ],
              ),
            )),
        const Positioned(
          bottom: -40,
          left: 0,
          right: 0,
          child: UserAvatar(),
        ),
      ],
    );
  }
}
