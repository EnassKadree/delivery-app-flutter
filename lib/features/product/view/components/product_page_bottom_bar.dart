import 'package:delivery_app/core/Extensions/context_extension.dart';
import 'package:delivery_app/core/Extensions/widget.extenstion.dart';
import 'package:delivery_app/features/app/model/product.dart';
import 'package:delivery_app/core/components/add_to_cart_button_builder.dart';
import 'package:flutter/material.dart';


class ProductPageBottomBar extends StatelessWidget {
  const ProductPageBottomBar({super.key, required this.product});
  final ProductModel product;

  @override
  Widget build(BuildContext context) 
  {
    return Container
    (
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: context.colorScheme.primary,
          borderRadius: BorderRadius.circular(12)),
      child: AddToCartButtonBuilder(product: product),
    ).mainPadding;
  }
}