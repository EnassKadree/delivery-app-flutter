import 'package:delivery_app/features/app/model/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';

import '../../features/favourite/service/favorite/favorite_cubit.dart';

class FavoriteButton extends StatelessWidget 
{
  const FavoriteButton({super.key, required this.product, this.size = 16});
  final ProductModel product;
  final double size;

  @override
  Widget build(BuildContext context) {
    Color color = product.isFavorite ?? false ? Colors.red[800]! : Colors.white;
    return BlocBuilder<FavoriteCubit, FavoriteState>(
      builder: (context, state) 
      {
        return InkWell
        (
          onTap: () 
          {
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
            radius: size,
            backgroundColor: Colors.red.withOpacity(.2),
            child:
                Icon(Iconsax.heart, size: size + 4, color: color),
          ),
        );
      },
    );
  }
}