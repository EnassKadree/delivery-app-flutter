
import 'package:delivery_app/core/Extensions/widget.extenstion.dart';
import 'package:delivery_app/features/app/model/product.dart';
import 'package:flutter/material.dart';

import 'product_container.dart';

class ProductsList extends StatelessWidget {
  const ProductsList({
    super.key, required this.products,
  });
  final List<ProductModel> products;

  @override
  Widget build(BuildContext context) {
    return GridView.builder
    (
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(), 
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount
      (
        childAspectRatio: .7,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        crossAxisCount: 2,
      ), 
      itemCount: products.length,
      itemBuilder: (context, index)
      {
        return ProductContainer(product: products[index],).staggerListHorizontal(index);
      }
    );
  }
}
