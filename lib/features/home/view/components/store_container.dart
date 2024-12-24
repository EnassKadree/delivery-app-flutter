
import 'package:delivery_app/core/Extensions/widget.extenstion.dart';
import 'package:flutter/material.dart';

import '../../../../Core/constants/shadows_constatns.dart';
import '../../../../core/constants/app_assets.dart';

class StoreContainer extends StatelessWidget {
  const StoreContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container
    (
      
      width: MediaQuery.of(context).size.width/4,
      margin: const EdgeInsets.symmetric(horizontal: 8),
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration
      (
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: ShadowsConsts.lg
      ),
      child: Column
      (
        children: 
        [
          Container
          (
            decoration: BoxDecoration
            (
              color: Colors.white.withOpacity(.4),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Image.asset(AppAssets.logo1String)
          ).mainPadding,
          const Text('hello kitty')
        ],
      ),
    );
  }
}