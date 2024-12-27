
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/styles_constants.dart';
import '../../../app/model/store.dart';

class StoreCard extends StatelessWidget {
  const StoreCard({
    super.key,
    required this.locale,
    required this.store,
  });

  final String locale;
  final StoreModel store;

  @override
  Widget build(BuildContext context) {
    return Container
    (
      decoration: const BoxDecoration
      (
        gradient: LinearGradient
        (
          colors: AppColors.yellowGradient, 
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
            child: const Icon(Iconsax.lovely, color: AppColors.blueColor, size: 24,)
          ),
          Row
          (
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: 
            [
              Center(
                child: Text(
                  store.name ?? '',
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
