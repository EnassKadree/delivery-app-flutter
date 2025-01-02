import 'package:delivery_app/core/Extensions/space_extension.dart';
import 'package:delivery_app/core/Extensions/string_extensions.dart';
import 'package:delivery_app/features/app/model/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';

import '../constants/json_constants.dart';
import '../constants/styles_constants.dart';
import '../../features/cart/service/cart/cart_cubit.dart';

class AddToCartButtonBuilder extends StatelessWidget {
  const AddToCartButtonBuilder({super.key, required this.product});
  final ProductModel product;

  @override
  Widget build(BuildContext context) 
  {
    String text = product.isInCart ?? false
      ? JsonConstants.removeFromCart.t(context)
      : JsonConstants.addToCart.t(context);
    return BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          return InkWell(
            onTap: () async {
              final cubit = context.read<CartCubit>();
              if (!product.isInCart!) 
              {
                cubit.addToCart(product.id!);
                text = JsonConstants.removeFromCart.t(context);
              } else {
                cubit.removeFromCart(product.id!);
                text = JsonConstants.addToCart.t(context);
              }
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Iconsax.shopping_cart,
                  color: Colors.white,
                ),
                8.spaceW,
                Text(
                  text,
                  style: StylesConsts.whiteTextXs,
                ),
              ],
            ),
          );
        },
      );
  }
}