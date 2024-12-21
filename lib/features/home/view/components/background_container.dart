
import 'package:flutter/material.dart';

import '../../../../Core/constants/app_colors.dart';
import '../../../../Core/constants/shadows_constatns.dart';
import '../../../../core/clipper/custom_clipper1.dart';
import '../../../../core/clipper/custom_clipper2.dart';

class BackgroundContainer extends StatelessWidget {
  const BackgroundContainer({
    super.key, required this.height,
  });
  final double height;

  @override
  Widget build(BuildContext context) {
    return Stack
    (
      children: 
      [
        AnimatedContainer
        (
          duration: const Duration(milliseconds: 800),
          curve: Curves.easeInOut,
          height: height,
          width: double.infinity, 
          child: ClipPath
          (
            clipper: CustomCurveClipper(),
            child: Container
            (
              constraints: BoxConstraints
              (
                maxHeight: MediaQuery.of(context).size.height/2
              ),
              height: height,
              padding: EdgeInsets.zero,
              decoration: BoxDecoration
              (
                boxShadow: ShadowsConsts.sm,
                color: AppColors.yellowColor
              ),
            ),
          ),
        ),
        AnimatedContainer
        (
          duration: const Duration(milliseconds: 800),
          curve: Curves.easeInOut,
          height: height * .7,
          width: double.infinity, 
          child: ClipPath
          (
            clipper: CustomCurveClipper2(),
            child: Container
            (
              constraints: BoxConstraints
              (
                maxHeight: MediaQuery.of(context).size.height/2
              ),
              height: height,
              padding: EdgeInsets.zero,
              decoration: BoxDecoration
              (
                boxShadow: ShadowsConsts.sm,
                color: AppColors.lightYellowColor
              ),
            ),
          ),
        ),
      ],
    );
  }
}