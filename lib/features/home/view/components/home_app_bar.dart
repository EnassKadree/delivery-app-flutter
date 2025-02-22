import 'package:delivery_app/core/Extensions/context_extension.dart';
import 'package:delivery_app/features/profile/view/profile.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../core/functions/functions.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      scrolledUnderElevation: 0,
      centerTitle: false,
      backgroundColor: Colors.transparent,
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: CircleAvatar(
            backgroundColor: context.colorScheme.primary,
            child: IconButton(
                onPressed: () {
                  context.push(const ProfilePageWrapper());
                },
                icon: const Icon(
                  Iconsax.profile_circle,
                )),
          ),
        ),
      ],
      title: CircleAvatar(
        radius: 22,
        backgroundColor: Colors.white.withOpacity(.4),
        child: IconButton(
          onPressed: () 
          {
            Functions().showSettingsDialog(context);
          },
          icon: Icon(
            Iconsax.menu_1,
            color: context.colorScheme.primary,
          ),
        ),
      ),
    );
  }
}
