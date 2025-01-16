import 'package:delivery_app/core/Extensions/context_extension.dart';
import 'package:delivery_app/core/Extensions/space_extension.dart';
import 'package:delivery_app/features/product/view/product_details.dart';
import 'package:flutter/material.dart';


import '../network/end_point.dart';
import 'add_to_cart_button_builder.dart';
import 'favorite_button.dart';
import 'store_name.dart';
import '../constants/app_assets.dart';
import '../../features/app/model/product.dart';

class ProductContainer extends StatelessWidget {
  const ProductContainer({
    super.key,
    required this.product,
  });
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return InkWell
    (
      onTap: (){context.push(ProductDetails(product: product));},
      child: Container
      (
          padding: const EdgeInsets.only(right: 8, left: 8, top: 8),
          decoration: BoxDecoration(
            color: context.colorScheme.surfaceContainer,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column
          (
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
                      child: Image.network(
                      product.image != null && product.image!.isNotEmpty
                          ? '${EndPoint.storageBaseUrl}${product.image}'
                          : '',
                      errorBuilder: (context, error, stackTrace) {
                        return Image.asset(AppAssets.logo1String);
                      },
                    )
                    ),
                    FavoriteButton(product: product)
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
              StoreName(product: product),
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
                child: AddToCartButtonBuilder(product: product)
              )
            ],
          )),
    );
  }
}
