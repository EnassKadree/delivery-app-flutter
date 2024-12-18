import 'package:delivery_app/core/Extensions/context_extension.dart';
import 'package:delivery_app/core/Extensions/space_extension.dart';
import 'package:delivery_app/core/Extensions/widget.extenstion.dart';
import 'package:delivery_app/core/constants/app_assets.dart';
import 'package:delivery_app/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/styles_constants.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) 
  {
    return Scaffold
    (
      backgroundColor: AppColors.blueColor,
      body: ListView
      (
        physics: const BouncingScrollPhysics(),

        children: 
        [
          context.verticalSpace(0.1),
          Image.asset(AppAssets.logo1String, height: 100,),
          const Center(child: Text('Delivery Compo', style: StylesConsts.titleText)),
          const Center(child: Text('fast delivery app', style: StylesConsts.whiteTextSm)),
          32.spaceW,
        ],
      ).mainPadding,
    );
  }
}