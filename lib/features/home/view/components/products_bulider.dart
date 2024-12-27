
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../core/components/something_went_wrong.dart';
import '../../../../core/lists/lists.dart';
import '../../../app/model/product.dart';
import '../../service/Products/products_cubit.dart';
import 'products_list.dart';

class ProductsBuilder extends StatelessWidget {
  const ProductsBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) 
      {
        if(state is! ProductsFailure)
        {
          List<ProductModel> products = state is ProductsSuccess ? state.products :Lists().dummyProducts();
          return Skeletonizer
          (
            enabled: state is ProductsLoading,
            child: ProductsList(products: products,)
          );
        }
        return SomeThingWentWrongWidget(onPressed: ()
        {
          context.read<ProductsCubit>().getProducts();
        });
      },
    );
  }
}
