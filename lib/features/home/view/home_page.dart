import 'package:delivery_app/core/Extensions/space_extension.dart';
import 'package:delivery_app/core/Extensions/string_extensions.dart';
import 'package:delivery_app/core/Extensions/widget.extenstion.dart';
import 'package:delivery_app/core/constants/json_constants.dart';
import 'package:delivery_app/core/constants/styles_constants.dart';
import 'package:delivery_app/features/app/model/category.dart';
import 'package:flutter/material.dart';

import 'components/categories_slider.dart';
import 'components/products_list.dart';
import 'components/stores_list.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) 
  {
    return ListView
    (
      physics: const BouncingScrollPhysics(),
      children: 
      [
        CategoriesSlider(categories: 
        [
            CategoryModel(name: 'makeup'),
            CategoryModel(name: 'clothes'),
            CategoryModel(name: 'electronics'),
            CategoryModel(name: 'food'),
        ],),
        Text(JsonConstants.stores.t(context), style: StylesConsts.darkTextLg,).horizontalPadding,
        const StoresList(),
        Text(JsonConstants.products.t(context), style: StylesConsts.darkTextLg,).horizontalPadding,
        16.spaceH, 
        const ProductsList().horizontalPadding
      ],
    );
  }
}
