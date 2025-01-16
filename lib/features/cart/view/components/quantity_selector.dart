import 'package:delivery_app/features/app/model/product.dart';
import 'package:delivery_app/features/cart/service/cart%20products/cart_products_cubit.dart';
import 'package:delivery_app/features/cart/service/cart/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';

import '../../service/Quantity Cubit/quantity_cubit.dart';


class QuantitySelector extends StatelessWidget 
{
  const QuantitySelector({super.key, required this.onQuantityChanged, required this.product, this.cart = true});
  final ValueChanged<int> onQuantityChanged;
  final ProductModel product;
  final bool cart;

  @override
  Widget build(BuildContext context) 
  {
    return Row
    (
      mainAxisSize: MainAxisSize.min,
      children: 
      [
        IconButton
        (
          icon: const Icon(Iconsax.minus),
          onPressed: () 
          { 
            final quantityCubit = context.read<QuantityCubit>();
            if(quantityCubit.state > 1)
            {
              quantityCubit.decrement();
              onQuantityChanged(quantityCubit.state); //* I'm trying to notify the parent here
              if(cart)
              {
                context.read<CartCubit>().removeOneFromCart(product.id!);
                Future.delayed(const Duration(seconds: 3), () 
                {
                  context.read<CartProductsCubit>().getCart();
                });
              }
            }
          },
        ),
        BlocBuilder<QuantityCubit, int>
        (
          builder: (context, quantity) 
          {
            return Text(quantity.toString(), style: const TextStyle(fontSize: 18),);
          },
        ),
        IconButton(
          icon: const Icon(Iconsax.add),
          onPressed: () async
          { 
            final quantityCubit = context.read<QuantityCubit>();
              quantityCubit.increment();
              onQuantityChanged(quantityCubit.state); //* I'm trying to notify the parent here
              if(cart)
              {
                context.read<CartCubit>().addToCart(product.id!);
                Future.delayed(const Duration(seconds: 3), () 
                {
                  context.read<CartProductsCubit>().getCart();
                });
              }
          },
        ),
        IconButton
        (
          icon: const Icon(Iconsax.close_circle),
          onPressed: ()
          {
            if(cart)
            {
              context.read<CartCubit>().removeFromCart(product.id!);
              context.read<CartProductsCubit>().getCart();
            }
          }
        )
      ],
    );
  }
}