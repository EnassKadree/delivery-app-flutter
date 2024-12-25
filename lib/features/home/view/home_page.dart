import 'package:delivery_app/core/Extensions/space_extension.dart';
import 'package:delivery_app/core/Extensions/string_extensions.dart';
import 'package:delivery_app/core/Extensions/widget.extenstion.dart';
import 'package:delivery_app/core/constants/json_constants.dart';
import 'package:delivery_app/core/constants/styles_constants.dart';
import 'package:flutter/material.dart';

import '../../../core/functions/functions.dart';
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
        const ProductsList().horizontalPadding
      ]),
    );
  }
}
