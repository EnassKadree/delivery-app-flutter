
import 'package:flutter/material.dart';

import 'product_container.dart';

class ProductsList extends StatelessWidget {
  const ProductsList({
    super.key,
  });

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
      itemCount: 10,
      itemBuilder: (context, index)
      {
        return const ProductContainer();
      }
    );
  }
}
