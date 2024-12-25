import 'package:delivery_app/core/Extensions/space_extension.dart';
import 'package:delivery_app/core/Extensions/string_extensions.dart';
import 'package:delivery_app/core/Extensions/widget.extenstion.dart';
import 'package:delivery_app/core/constants/json_constants.dart';
import 'package:delivery_app/core/constants/styles_constants.dart';
import 'package:delivery_app/core/lists/lists.dart';
import 'package:delivery_app/features/app/model/category.dart';
import 'package:delivery_app/features/home/service/categories/categories_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../core/components/something_went_wrong.dart';
import 'components/categories_slider.dart';
import 'components/products_list.dart';
import 'components/stores_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: [
        BlocBuilder<CategoriesCubit, CategoriesState>
        (
          builder: (context, state) 
          {
            if(state is! CategoriesFailure)
            {
              final List<CategoryModel> categories = state is CategoriesSuccess ? state.categories : Lists().dummyCategories();
              return Skeletonizer(
                enabled: state is CategoriesLoading,
                child: CategoriesSlider(categories: categories),
              );
            }
            return SomeThingWentWrongWidget
            (
              onPressed: (){context.read<CategoriesCubit>().getCategories();},
            );
          },
        ),
        Text(
          JsonConstants.stores.t(context),
          style: StylesConsts.darkTextLg,
        ).horizontalPadding,
        const StoresList(),
        Text(
          JsonConstants.products.t(context),
          style: StylesConsts.darkTextLg,
        ).horizontalPadding,
        16.spaceH,
        const ProductsList().horizontalPadding
      ],
    );
  }
}
