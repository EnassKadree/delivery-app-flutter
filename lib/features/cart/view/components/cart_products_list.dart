
import 'package:delivery_app/core/Extensions/widget.extenstion.dart';
import 'package:flutter/material.dart';

import '../../../app/model/product.dart';
import 'cart_product_container.dart';

class CartProductsList extends StatelessWidget {
  const CartProductsList({
    super.key,
    required this.products,
  });

  final List<ProductModel> products;

  @override
  Widget build(BuildContext context) {
    return Padding
    (
      padding: const EdgeInsets.only(bottom: 32),
      child: ListView.builder
      (
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(), 
        itemCount: products.length,
        itemBuilder: (context, index)
        {
          return CartProductContainer
          (
            product: products[index],
            onQuantityChanged: (quantity) 
            {
              //products[index].quantity =  quantity; //*  I'm Tracking quantity for each product
            },
          ).staggerListVertical(index);
        }
      )
    );
  }
}
