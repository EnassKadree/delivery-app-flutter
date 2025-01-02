
import 'package:delivery_app/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/app_assets.dart';

class ProductImage extends StatelessWidget {
  const ProductImage({
    super.key, required this.image,
  });
  final String? image;
  // ToDo: add product image...

  @override
  Widget build(BuildContext context) {
    return Container
    (
      decoration: BoxDecoration
      (
        color: AppColors.backGroundGreyColor.withOpacity(.8),
        borderRadius: const BorderRadius.only
        (
          bottomLeft: Radius.circular(24),
          bottomRight: Radius.circular(24),
        )
      ),
      height: MediaQuery.of(context).size.height/2.5,
      padding: const EdgeInsets.all(32),
      child: Image.asset(
      AppAssets.logo1String,
        fit: BoxFit.contain,
      ),
    );
  }
}