import 'package:delivery_app/core/Extensions/space_extension.dart';
import 'package:delivery_app/core/Extensions/string_extensions.dart';
import 'package:delivery_app/core/constants/app_colors.dart';
import 'package:delivery_app/core/constants/json_constants.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../core/constants/styles_constants.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          14.spaceH,
          Text(JsonConstants.quickCart.t(context),
              style: StylesConsts.midTitleText
                  .copyWith(color: AppColors.blueColor)),
          const Spacer(),
          IconButton(onPressed: () {}, icon: const Icon(Iconsax.search_normal,color: AppColors.blueColor)),
          IconButton(onPressed: () {}, icon: const Icon(Iconsax.notification,color: AppColors.blueColor)),
          const UserAvatar()
        ],
      ),
    );
  }
}

class UserAvatar extends StatelessWidget {
  final String? imageUrl;

  const UserAvatar({super.key, this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 20, 
      backgroundColor: Colors.grey[300], 
      child: imageUrl == null || imageUrl!.isEmpty
          ? const Icon(
              Iconsax.user, 
              size: 17,
              color: AppColors.blueColor,
            )
          : ClipOval(
              child: Image.asset(
                imageUrl!,
                fit: BoxFit.cover,
                width: 100,
                height: 100,
              ),
            ),
    );
  }
}
