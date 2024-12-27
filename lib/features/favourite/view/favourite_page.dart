import 'package:delivery_app/core/Extensions/space_extension.dart';
import 'package:delivery_app/core/Extensions/string_extensions.dart';
import 'package:delivery_app/core/constants/styles_constants.dart';
import 'package:delivery_app/features/favourite/service/favorite%20products/favorite_products_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/constants/json_constants.dart';
import 'components/favorite_products_builder.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, right: 16, left: 16),
      child: ListView
      (
        children:
        [
          Text(JsonConstants.favorite.t(context), style: StylesConsts.darkTextLg,),
          16.spaceH,
          const FavoriteProductsBuilder()
        ]
      ),
    );
  }
}

class FavoritePageWrapper extends StatelessWidget {
  const FavoritePageWrapper({super.key});

  @override
  Widget build(BuildContext context) 
  {
    return MultiBlocProvider
    (
      providers: 
      [
        BlocProvider(create: (context) => FavoriteProductsCubit()..getFavoriteProducts())
      ], child: const FavoritePage()
    );
  }
}