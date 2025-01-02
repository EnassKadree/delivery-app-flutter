import 'package:delivery_app/core/Extensions/context_extension.dart';
import 'package:delivery_app/core/Extensions/space_extension.dart';
import 'package:delivery_app/core/Extensions/string_extensions.dart';
import 'package:delivery_app/core/Extensions/widget.extenstion.dart';
import 'package:delivery_app/core/constants/app_colors.dart';
import 'package:delivery_app/core/constants/json_constants.dart';
import 'package:delivery_app/core/constants/styles_constants.dart';
import 'package:delivery_app/core/functions/functions.dart';
import 'package:delivery_app/features/app/model/product.dart';
import 'package:delivery_app/features/product/view/components/description_section.dart';
import 'package:delivery_app/core/components/favorite_button.dart';
import 'package:delivery_app/features/product/view/components/product_page_bottom_bar.dart';
import 'package:delivery_app/core/components/store_name.dart';
import 'package:flutter/material.dart';

import 'components/product_image.dart';
import 'components/stock_card_widget.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key, required this.product});
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    return Scaffold
    (
      backgroundColor: context.theme.colorScheme.surface,
      bottomNavigationBar: ProductPageBottomBar(product: product),
      body: Column
      (
        children: 
        [
          ProductImage(image: product.image).staggerListVertical(0),
          Expanded
          (
            child: ListView
            (
              children: Functions().staggeredList(
              [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: 
                  [
                    Text(product.name ?? "", style: StylesConsts.darkTextLg),
                    FavoriteButton(product: product, size: 20)
                  ],
                ),
                8.spaceH,
                Text(
                    "${Functions().formatNumberWithCommas(product.price ?? 0)} ${JsonConstants.syp.t(context)}",
                    style: StylesConsts.midTitleText.copyWith(color: AppColors.blueColor)),
                8.spaceH,
                StoreName(product: product, size: 16,),
                8.spaceH,
                StockCardWidget(stockCount: product.stock ?? 0,),
                8.spaceH,
                DescriptionSection(description: product.description),
              ]),
            ).horizontalPadding,
          ),
        ],
      ),
    );
  }
}

