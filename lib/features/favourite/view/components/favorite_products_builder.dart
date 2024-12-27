
import 'package:delivery_app/core/lists/lists.dart';
import 'package:delivery_app/features/app/model/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../core/components/something_went_wrong.dart';
import '../../../../core/functions/functions.dart';
import '../../../../core/components/products_list.dart';
import '../../service/favorite products/favorite_products_cubit.dart';

class FavoriteProductsBuilder extends StatelessWidget {
  const FavoriteProductsBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FavoriteProductsCubit, FavoriteProductsState>
    (
      listener: (context, state)
      {
        if(state is FavoriteProductsFailure)
        {
          Functions().showAlertDialog(context, false, state.message);
        }
      },
      builder: (context, state)
      {
        if(state is! FavoriteProductsFailure)
        {
          List<ProductModel> products = state is FavoriteProductsSuccess ? state.products : Lists().dummyProducts();
          return Skeletonizer
          (
            enabled: state is FavoriteProductsLoading,
            child: ProductsList(products: products)
          );
        }
        return SomeThingWentWrongWidget(onPressed: ()
        {
          context.read<FavoriteProductsCubit>().getFavoriteProducts();
        });
      }, 
    );
  }
}
