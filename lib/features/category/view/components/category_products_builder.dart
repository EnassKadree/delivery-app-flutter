
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../core/components/products_list.dart';
import '../../../../core/components/something_went_wrong.dart';
import '../../../../core/functions/functions.dart';
import '../../../../core/lists/lists.dart';
import '../../../app/model/category.dart';
import '../../../app/model/product.dart';
import '../../service/category products/category_products_cubit.dart';

class CategoryProductsBuilder extends StatelessWidget {
  const CategoryProductsBuilder({
    super.key,
    required this.category,
  });

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CategoryProductsCubit, CategoryProductsState>
    (
      listener: (context,state) 
      {
        if(state is CategoryProductsFailure)
        {
          Functions().showAlertDialog(context, false, state.message);
        }
      },
      builder: (context, state)
      {
        if(state is! CategoryProductsFailure)
        {
          List<ProductModel> products = state is CategoryProductsSuccess ? state.products :
            Lists().dummyProducts();
          return Skeletonizer
          (
            enabled: state is CategoryProductsLoading,
            child: ProductsList(products: products)
          );
        }
        return SomeThingWentWrongWidget(onPressed: ()
        {
          context.read<CategoryProductsCubit>().getCategoryProducts(category.id!);
        });
      }
    );
  }
}
