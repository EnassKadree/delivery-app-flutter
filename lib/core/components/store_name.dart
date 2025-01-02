
import 'package:delivery_app/core/Extensions/context_extension.dart';
import 'package:delivery_app/core/Extensions/space_extension.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../constants/styles_constants.dart';
import '../../features/app/model/product.dart';

class StoreName extends StatelessWidget {
  const StoreName({
    super.key,
    required this.product, this.size = 12,
  });

  final ProductModel product;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: size,
          backgroundColor: context.colorScheme.primary.withOpacity(.4),
          child: Icon(
            Iconsax.image,
            size: size + 2,
          ),
        ),
        4.spaceW,
        Text
        (
          product.store ?? '',
          style: StylesConsts.yellowTextXs.copyWith(color: Colors.grey[600], fontSize: size),
        )
      ],
    );
  }
}
