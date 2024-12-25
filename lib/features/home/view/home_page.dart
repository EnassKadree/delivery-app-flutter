import 'package:delivery_app/core/Extensions/space_extension.dart';
import 'package:delivery_app/core/Extensions/string_extensions.dart';
import 'package:delivery_app/core/Extensions/widget.extenstion.dart';
import 'package:delivery_app/core/components/something_went_wrong.dart';
import 'package:delivery_app/core/constants/json_constants.dart';
import 'package:delivery_app/core/constants/styles_constants.dart';
import 'package:delivery_app/core/lists/lists.dart';
import 'package:delivery_app/features/app/model/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../core/functions/functions.dart';
import '../service/Products/products_cubit.dart';
import 'components/categories_builder.dart';
import 'components/products_list.dart';
import 'components/stores_builder.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: Functions().staggeredList([
        const CategoriesBuilder(),
        Text(
          JsonConstants.stores.t(context),
          style: StylesConsts.darkTextLg,
        ).horizontalPadding,
        const StoresBuilder(),
        Text(
          JsonConstants.products.t(context),
          style: StylesConsts.darkTextLg,
        ).horizontalPadding,
        16.spaceH,
        BlocBuilder<ProductsCubit, ProductsState>(
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
        ).horizontalPadding
      ]),
    );
  }
}
