import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../core/components/something_went_wrong.dart';
import '../../../../core/functions/functions.dart';
import '../../../../core/lists/lists.dart';
import '../../../app/model/product.dart';
import '../../service/cart products/cart_products_cubit.dart';
import 'cart_products_list.dart';

class CartProductsBuilder extends StatelessWidget {
  const CartProductsBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartProductsCubit, CartProductsState>
    (
      listener: (context, state)
      {
        if(state is CartProductsFailure)
        {
          Functions().showAlertDialog(context, false, state.message);
        }
      },
      builder: (context,state)
      {
        if(state is! CartProductsFailure)
        {
          List<ProductModel> products = state is CartProductsSuccess ? 
            state.cart.products ?? [] : Lists().dummyProducts();
          return Skeletonizer
          (
            enabled: state is CartProductsLoading,
            child: CartProductsList(products: products)
          );
        }
        return SomeThingWentWrongWidget(onPressed: ()
        {
          context.read<CartProductsCubit>().getCart();
        });
      }, 
    );
  }
}
