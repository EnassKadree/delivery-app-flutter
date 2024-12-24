
import 'package:delivery_app/core/Extensions/context_extension.dart';
import 'package:delivery_app/core/Extensions/space_extension.dart';
import 'package:delivery_app/core/Extensions/string_extensions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/json_constants.dart';
import '../../../../core/constants/styles_constants.dart';

class ProductContainer extends StatelessWidget {
  const ProductContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container
    (
      padding: const EdgeInsets.only(right: 8, left: 8, top: 8),
      decoration: BoxDecoration
      (
        color: Colors.white, 
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column
      (
        crossAxisAlignment: CrossAxisAlignment.start,
        children: 
        [
          Expanded(
            child: Stack
            (
              children: 
              [
                Container
                (
                  height: double.infinity,
                  width: double.infinity,
                  decoration: BoxDecoration
                  (
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Image.asset(AppAssets.logo1String),
                ),
                CircleAvatar
                (
                  radius: 16,
                  backgroundColor: Colors.red.withOpacity(.2),
                  child: const Icon(Iconsax.heart, size: 16,),
                )
              ],
            ),
          ),
          8.spaceH, 
          const Row
          (
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: 
            [
              Text
              (
                'product fun', 
                style: TextStyle
                (
                  fontSize: 18,
                  fontWeight: FontWeight.bold
                ),
                overflow: TextOverflow.ellipsis,
                softWrap: true,
              ),
              Text('30\$')
            ],
          ),
          4.spaceH,
          Row
          (
            children: 
            [
              CircleAvatar
              (
                radius: 12,
                backgroundColor: context.colorScheme.primary.withOpacity(.4),
                child: const Icon(Iconsax.image, size: 14,),
              ),
              4.spaceW,
              const Text('hello kitty', style: TextStyle(fontSize: 12),)
            ],
          ),
          8.spaceH, 
          Container
          (
            padding: const EdgeInsets.all(4),
            width: double.infinity,
            decoration: BoxDecoration
            (
              color: context.colorScheme.primary,
              borderRadius: const BorderRadius.only
              (
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              )
            ),
            child: Row
            (
            children: 
            [
              const Spacer(),
              const Icon(Iconsax.shopping_cart, color: Colors.white,),
              8.spaceW, 
              Text
              (
                JsonConstants.addToCart.t(context),
                style: StylesConsts.whiteTextXs,
              ),
              const Spacer()
            ],
            ),
          )
        ],
      )
    );
  }
}