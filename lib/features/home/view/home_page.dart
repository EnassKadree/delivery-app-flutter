import 'package:delivery_app/core/Extensions/space_extension.dart';
import 'package:delivery_app/core/Extensions/string_extensions.dart';
import 'package:delivery_app/core/Extensions/widget.extenstion.dart';
import 'package:delivery_app/core/constants/json_constants.dart';
import 'package:delivery_app/core/constants/styles_constants.dart';
import 'package:delivery_app/features/category/view/components/search_bar.dart';
import 'package:delivery_app/features/home/service/Products/products_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/functions/functions.dart';
import 'components/categories_builder.dart';
import 'components/products_bulider.dart';
import 'components/stores_builder.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) 
  {
    TextEditingController searchController = TextEditingController();
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: Functions().staggeredList([
        CustomSearchBar
        (
          color: Colors.white.withOpacity(.3),
          controller: searchController,
          onTap: ()
          {
            context.read<ProductsCubit>().getProducts(searchController.text);
          },
        ).horizontalPadding,
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
        const ProductsBuilder().horizontalPadding
      ]),
    );
  }
}
