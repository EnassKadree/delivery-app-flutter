import 'package:delivery_app/core/Extensions/space_extension.dart';
import 'package:delivery_app/core/constants/app_assets.dart';
import 'package:delivery_app/core/constants/app_colors.dart';
import 'package:delivery_app/core/constants/styles_constants.dart';
import 'package:delivery_app/core/functions/functions.dart';
import 'package:flutter/material.dart';

class StorItem extends StatelessWidget {
  const StorItem({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {},
        child: SizedBox(
          height: 100,
          child: Container(
            decoration: BoxDecoration(
                color: AppColors.white, borderRadius: BorderRadius.circular(8)),
            child: AspectRatio(
              aspectRatio: 10 / 5,
              child: Row(
                children: [
                  AspectRatio(
                    aspectRatio: 10 / 5,
                    child: Container(
                      decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(8)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            AspectRatio(
                              aspectRatio: 2 / 3,
                              child: Container(
                                decoration: BoxDecoration(
                                  
                                    borderRadius: BorderRadius.circular(8),
                                    image: const DecorationImage(
                                        image:
                                            AssetImage(AppAssets.logo1String),
                                        fit: BoxFit.fill)),
                              ),
                            ),
                            30.spaceW,
                            Expanded(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                      width:
                                          MediaQuery.of(context).size.width *
                                              .5,
                                      child: Text("Omea",
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: StylesConsts.midTitleText
                                              .copyWith(
                                                  color:
                                                      AppColors.blackColor))),
                                  3.spaceH,
                                  Text(
                                    "Sahnaya_altawari",
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: StylesConsts.yellowTextXs.copyWith(
                                        fontWeight: FontWeight.normal,
                                        color: AppColors.blackColor),
                                  ),
                                  const SizedBox(
                                    height: 3,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
