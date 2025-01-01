import 'package:delivery_app/core/Extensions/context_extension.dart';
import 'package:delivery_app/core/Extensions/space_extension.dart';
import 'package:delivery_app/core/Extensions/string_extensions.dart';
import 'package:delivery_app/features/cart/service/cart/cart_cubit.dart';
import 'package:delivery_app/features/favourite/service/favorite/favorite_cubit.dart';
import 'package:delivery_app/features/home/view/components/product_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';

import '../constants/app_assets.dart';
import '../constants/json_constants.dart';
import '../constants/styles_constants.dart';
import '../../features/app/model/product.dart';

class ProductContainer extends StatelessWidget {
  const ProductContainer({
    super.key,
    required this.product,
  });
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    Color color = product.isFavorite ?? false ? Colors.red[800]! : Colors.white;
    String text = product.isInCart ?? false
        ? JsonConstants.removeFromCart.t(context)
        : JsonConstants.addToCart.t(context);
    return Container(
        padding: const EdgeInsets.only(right: 8, left: 8, top: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Stack(
                children: [
                  GestureDetector(
                    onTap: () {
                      // context.push(ProductDetails(
                      //   product: product,
                      // ));
                    },
                    child: Container(
                      height: double.infinity,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Image.asset(AppAssets.logo1String),
                    ),
                  ),
                  BlocBuilder<FavoriteCubit, FavoriteState>(
                    builder: (context, state) {
                      return InkWell(
                        onTap: () {
                          final cubit = context.read<FavoriteCubit>();
                          if (product.isFavorite!) {
                            cubit.removeFromFavorite(product.id!);
                            color = Colors.white;
                          } else {
                            cubit.addToFavorite(product.id!);
                            color = Colors.red[800]!;
                          }
                        },
                        child: CircleAvatar(
                          radius: 16,
                          backgroundColor: Colors.red.withOpacity(.2),
                          child: Icon(Iconsax.heart, size: 20, color: color),
                        ),
                      );
                    },
                  )
                ],
              ),
            ),
            8.spaceH,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  product.name ?? '',
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                  overflow: TextOverflow.ellipsis,
                  softWrap: true,
                ),
                Text(product.price.toString())
              ],
            ),
            4.spaceH,
            Row(
              children: [
                CircleAvatar(
                  radius: 12,
                  backgroundColor: context.colorScheme.primary.withOpacity(.4),
                  child: const Icon(
                    Iconsax.image,
                    size: 14,
                  ),
                ),
                4.spaceW,
                Text(
                  product.store ?? '',
                  style: const TextStyle(fontSize: 12),
                )
              ],
            ),
            8.spaceH,
            Container(
              padding: const EdgeInsets.all(4),
              width: double.infinity,
              decoration: BoxDecoration(
                  color: context.colorScheme.primary,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                  )),
              child: BlocBuilder<CartCubit, CartState>(
                builder: (context, state) {
                  return InkWell(
                    onTap: () async {
                      final cubit = context.read<CartCubit>();
                      if (!product.isInCart!) {
                        cubit.addToCart(product.id!);
                        text = JsonConstants.removeFromCart.t(context);
                      } else {
                        cubit.removeFromCart(product.id!);
                        text = JsonConstants.addToCart.t(context);
                      }
                    },
                    child: Row(
                      children: [
                        const Spacer(),
                        const Icon(
                          Iconsax.shopping_cart,
                          color: Colors.white,
                        ),
                        8.spaceW,
                        Text(
                          text,
                          style: StylesConsts.whiteTextXs,
                        ),
                        const Spacer()
                      ],
                    ),
                  );
                },
              ),
            )
          ],
        ));
  }
}
