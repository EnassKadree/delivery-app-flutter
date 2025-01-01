import 'package:delivery_app/core/Extensions/context_extension.dart';
import 'package:delivery_app/core/Extensions/space_extension.dart';
import 'package:delivery_app/core/Extensions/string_extensions.dart';
import 'package:delivery_app/core/constants/app_colors.dart';
import 'package:delivery_app/core/constants/json_constants.dart';
import 'package:delivery_app/core/constants/styles_constants.dart';
import 'package:delivery_app/core/functions/functions.dart';
import 'package:delivery_app/features/app/model/product.dart';
import 'package:delivery_app/features/cart/service/cart/cart_cubit.dart';
import 'package:delivery_app/features/favourite/service/favorite/favorite_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key, required this.product});
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    Color color = product.isFavorite ?? false ? Colors.red[800]! : Colors.white;
    String text = product.isInCart ?? false
        ? JsonConstants.removeFromCart.t(context)
        : JsonConstants.addToCart.t(context);
    return Scaffold(
      backgroundColor: AppColors.backGroundGreyColor,
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: Container(
              padding: const EdgeInsets.all(50),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.white.withOpacity(0.4),
                ),
                padding: const EdgeInsets.all(9),
                child: Image.asset(
                product.image??'',
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              decoration: const BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
              ),
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(product.name ?? "",
                          style: StylesConsts.midTitleText
                              .copyWith(color: AppColors.blackColor)),
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
                              child:
                                  Icon(Iconsax.heart, size: 20, color: color),
                            ),
                          );
                        },
                      )
                    ],
                  ),
                  Text(product.store ?? '',
                      style: StylesConsts.yellowTextXs.copyWith(
                        color: Colors.grey[600],
                      )),
                  8.spaceH,
                  Text(
                      "${Functions().formatNumberWithCommas(product.price ?? 0)} ${JsonConstants.syp.t(context)}",
                      style: StylesConsts.yellowTextXs
                          .copyWith(color: AppColors.blueColor, fontSize: 20)),
                  8.spaceH,
                  StockCardWidget(
                    stockCount: product.stock ?? 0,
                  ),
                  8.spaceH,
                  Text(
                    JsonConstants.description.t(context),
                    style: StylesConsts.whiteTextXs
                        .copyWith(color: AppColors.blackColor),
                  ),
                  8.spaceH,
                  Text(
                      product.description??'',
                      style: StylesConsts.yellowTextXs.copyWith(
                        color: Colors.grey[600],
                      )),
                  const Spacer(),
                  Container(
                    padding: const EdgeInsets.all(4),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: context.colorScheme.primary,
                        borderRadius: BorderRadius.circular(18)),
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
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class StockCardWidget extends StatelessWidget {
  const StockCardWidget({super.key, required this.stockCount});
  final int stockCount;
  @override
  Widget build(BuildContext context) {
    String stockStatus;
    Gradient backgroundGradient;
    if (stockCount > 20) {
      backgroundGradient = LinearGradient(
        colors: AppColors.greenGradient,
      );
      stockStatus =
          '${JsonConstants.available.t(context)}($stockCount ${JsonConstants.items.t(context)})';
    } else if (stockCount > 0 && stockCount <= 20) {
      backgroundGradient = LinearGradient(
        colors: AppColors.orangeGradient,
      );
      stockStatus =
          '${JsonConstants.stock.t(context)} ($stockCount ${JsonConstants.items.t(context)})';
    } else {
      backgroundGradient = LinearGradient(
        colors: AppColors.redGradient,
      );
      stockStatus = JsonConstants.outOfStock.t(context);
    }

    return buildStockCard(context, stockStatus, stockCount, backgroundGradient);
  }
}

Widget buildStockCard(BuildContext context, String stockStatus, int stockCount,
    Gradient backgroundGradient) {
  return Card(
    margin: const EdgeInsets.symmetric(vertical: 8),
    child: Container(
      decoration: BoxDecoration(
        gradient: backgroundGradient,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '${JsonConstants.stock.t(context)}:',
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppColors.white),
            ),
            Text(
              stockStatus,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: AppColors.white,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
