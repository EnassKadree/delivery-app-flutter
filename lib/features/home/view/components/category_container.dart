
import 'package:delivery_app/core/constants/app_assets.dart';
import 'package:delivery_app/core/constants/styles_constants.dart';
import 'package:delivery_app/features/app/model/category.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../Core/constants/app_colors.dart';
import '../../../app/data/data_source.dart';

class CategoryContainer extends StatelessWidget {
  const CategoryContainer({
    super.key,
    required this.category,
  });
  final CategoryModel category;

  @override
  Widget build(BuildContext context) 
  {
    final String locale = DataSource().getLocale() ?? 'ar';
    return Container
    (
      decoration: const BoxDecoration
      (
        gradient: LinearGradient
        (
          colors: AppColors.blueGradient, 
        ),
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(vertical: 16),
      child: Stack
      (
        children: 
        [
          Align
          (
            alignment: locale == 'ar' ?
            Alignment.topRight : Alignment.topLeft,
            child: const Icon(Iconsax.lovely, color: AppColors.lightYellowColor, size: 24,)
          ),
          Row
          (
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: 
            [
              Center(
                child: Text(
                  category.name ?? '',
                  style: StylesConsts.whiteTextLg, 
                  textAlign: TextAlign.center,
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Container
              (
                padding: const EdgeInsets.all(8),
                height: double.infinity,
                width: MediaQuery.of(context).size.width/3,
                decoration: BoxDecoration
                (
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white.withOpacity(.4)
                ),
                child: Image.asset(AppAssets.logo1String)
              ),
            ],
          ),
        ],
      ),
    );
  }
}