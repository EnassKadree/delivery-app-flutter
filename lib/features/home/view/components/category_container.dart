import 'package:delivery_app/core/Extensions/context_extension.dart';
import 'package:delivery_app/core/constants/app_assets.dart';
import 'package:delivery_app/core/constants/styles_constants.dart';
import 'package:delivery_app/features/app/model/category.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../Core/constants/app_colors.dart';
import '../../../app/data/data_source.dart';
import '../../../category/view/category_page.dart';

class CategoryContainer extends StatelessWidget {
  const CategoryContainer({
    super.key,
    required this.category,
    this.clickable = true,
  });
  final CategoryModel category;
  final bool clickable;

  @override
  Widget build(BuildContext context) {
    final String locale = DataSource().getLocale() ?? 'ar';
    return InkWell(
      onTap: () {
        if (clickable) {
          context.push(CategoryPageWrapper(category: category));
        }
      },
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: AppColors.blueGradient,
          ),
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.symmetric(vertical: 16),
        child: Stack(
          children: [
            Align(
                alignment:
                    locale == 'ar' ? Alignment.topRight : Alignment.topLeft,
                child: const Icon(
                  Iconsax.lovely,
                  color: AppColors.lightYellowColor,
                  size: 24,
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Center(
                  child: Text(
                    category.name ?? '',
                    style: StylesConsts.whiteTextLg,
                    textAlign: TextAlign.center,
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Container(
                    padding: const EdgeInsets.all(8),
                    height: double.infinity,
                    width: MediaQuery.of(context).size.width / 3,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.white.withOpacity(.4)),
                    child: Image.network(
  'http://127.0.0.1:8000/storage/categories/6qiQWMny1LOFjhqQ1ASykoe3dtKcJhZr41JKub8E.png',
  width: 100,
  height: 100,
 
 
),),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
