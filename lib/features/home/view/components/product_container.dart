import 'package:delivery_app/core/Extensions/context_extension.dart';
import 'package:delivery_app/core/Extensions/space_extension.dart';
import 'package:delivery_app/core/Extensions/string_extensions.dart';
import 'package:delivery_app/features/cart/service/cart%20products/cart_products_cubit.dart';
import 'package:delivery_app/features/cart/service/cart/cart_cubit.dart';
import 'package:delivery_app/features/home/service/Products/products_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/json_constants.dart';
import '../../../../core/constants/styles_constants.dart';
import '../../../app/model/product.dart';

class ProductContainer extends StatelessWidget {
  const ProductContainer({
    super.key,
    required this.product,
  });
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
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
                  Container(
                    height: double.infinity,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Image.asset(AppAssets.logo1String),
                  ),
                  CircleAvatar(
                    radius: 16,
                    backgroundColor: Colors.red.withOpacity(.2),
                    child: Icon(
                      product.isFavorite ?? false
                          ? Iconsax.heart2
                          : Iconsax.heart,
                      size: 16,
                      color: product.isFavorite ?? false
                          ? Colors.red[800]
                          : Colors.white,
                    ),
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
              child: BlocBuilder<CartCubit, CartState>
              (
                builder: (context, state) 
                {
                  if(state is! CartLoading)
                  {
                    return InkWell
                    (
                      onTap: () async 
                      {
                        if(!product.isInCart!)
                        {
                          await context.read<CartCubit>().addToCart(product.id!);
                          context.read<ProductsCubit>().getProducts();
                        }
                        else
                        {
                          await context.read<CartCubit>().removeFromCart(product.id!);
                          context.read<ProductsCubit>().getProducts();
                          context.read<CartProductsCubit>().getCart();
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
                            product.isInCart ?? false
                                ? JsonConstants.removeFromCart.t(context)
                                : JsonConstants.addToCart.t(context),
                            style: StylesConsts.whiteTextXs,
                          ),
                          const Spacer()
                        ],
                      ),
                    );
                  }
                  return const Center(child: CircularProgressIndicator(color: Colors.white,),);
                },
              ),
            )
          ],
        ));
  }
}
