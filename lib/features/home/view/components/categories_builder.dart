
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../core/components/something_went_wrong.dart';
import '../../../../core/lists/lists.dart';
import '../../../app/model/category.dart';
import '../../service/categories/categories_cubit.dart';
import 'categories_slider.dart';

class CategoriesBuilder extends StatelessWidget {
  const CategoriesBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesCubit, CategoriesState>
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
    );
  }
}
