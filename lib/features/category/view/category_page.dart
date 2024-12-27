import 'package:delivery_app/core/Extensions/space_extension.dart';
import 'package:delivery_app/core/Extensions/widget.extenstion.dart';
import 'package:delivery_app/features/app/model/category.dart';
import 'package:delivery_app/features/category/service/category%20products/category_products_cubit.dart';
import 'package:delivery_app/features/category/view/components/search_bar.dart';
import 'package:delivery_app/features/home/view/components/category_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'components/category_products_builder.dart';


class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key, required this.category});
  final CategoryModel category;

  @override
  Widget build(BuildContext context) 
  {
    return Scaffold
    (
      body: ListView
      (
        shrinkWrap: true,
        children: 
        [
          32.spaceH,
          const CustomSearchBar(),
          SizedBox
          (
            height: MediaQuery.of(context).size.height/5,
            child: CategoryContainer(category: category, clickable: false)
          ),
          CategoryProductsBuilder(category: category)
        ],
      ).horizontalPadding,
    );
  }
}

class CategoryPageWrapper extends StatelessWidget {
  const CategoryPageWrapper({super.key, required this.category});
  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider
    (
      providers: [
        BlocProvider(create: (context) => CategoryProductsCubit()..getCategoryProducts(category.id!))
      ], 
      child: CategoryPage(category: category)
    );
  }
}