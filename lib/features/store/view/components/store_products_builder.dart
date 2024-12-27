import 'package:delivery_app/features/app/model/store.dart';
import 'package:delivery_app/features/store/service/store%20products/store_products_cubit.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../core/components/products_list.dart';
import '../../../../core/components/something_went_wrong.dart';
import '../../../../core/functions/functions.dart';
import '../../../../core/lists/lists.dart';
import '../../../app/model/product.dart';

class StoreProductsBuilder extends StatelessWidget {
  const StoreProductsBuilder({super.key, required this.store});
  final StoreModel store;

  @override
  Widget build(BuildContext context) 
  {
    return BlocConsumer<StoreProductsCubit, StoreProductsState>
    (
      listener: (context,state) 
      {
        if(state is StoreProductsFailure)
        {
          Functions().showAlertDialog(context, false, state.message);
        }
      },
      builder: (context, state)
      {
        if(state is! StoreProductsFailure)
        {
          List<ProductModel> products = state is StoreProductsSuccess ? state.products :
            Lists().dummyProducts();
          return Skeletonizer
          (
            enabled: state is StoreProductsLoading,
            child: ProductsList(products: products)
          );
        }
        return SomeThingWentWrongWidget(onPressed: ()
        {
          context.read<StoreProductsCubit>().getStoreProducts(store.id!);
        });
      }
    );
  }
}