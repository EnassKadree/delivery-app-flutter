
import 'package:delivery_app/features/app/model/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/network/end_point.dart';
import '../../service/Quantity Cubit/quantity_cubit.dart';
import 'quantity_selector.dart';


class OrderProductContainer extends StatelessWidget {
  const OrderProductContainer({
    super.key,
    required this.product,
    required this.onQuantityChanged
  });

  final ProductModel product;
  final ValueChanged<int> onQuantityChanged;

  @override
  Widget build(BuildContext context) 
  {
    return Card
    (
      shadowColor: Colors.grey[100]!.withOpacity(.5),
      color: Colors.white,
      child: ListTile
      (
        contentPadding: const EdgeInsets.symmetric(horizontal: 16),
        title: Text(product.name ?? '', style: TextStyle(color: Colors.blue[900], fontSize: 20),),
        subtitle: Text(product.price.toString(), style: const TextStyle(color: Colors.grey),),
        leading: CircleAvatar
        (
          child: Image.network(
            product.image != null && product.image!.isNotEmpty
                ? '${EndPoint.storageBaseUrl}${product.image}'
                : '',
            errorBuilder: (context, error, stackTrace) {
              return Image.asset(AppAssets.logo1String);
            },
            width: 100,
            height: 100,
          )
        ),
        trailing: Row
        (
          mainAxisSize: MainAxisSize.min,
          children:
          [
            BlocProvider
            (
              create: (context) => QuantityCubit(product.quantity ?? 0),
              child: QuantitySelector
              (
                product: product,
                onQuantityChanged: (quantity) 
                {
                  onQuantityChanged(quantity);
                },
              ),
            ),
          ]
        )
      ),
    );
  }
}