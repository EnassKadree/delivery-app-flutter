import 'package:delivery_app/core/Extensions/context_extension.dart';
import 'package:delivery_app/core/Extensions/space_extension.dart';
import 'package:delivery_app/core/Extensions/string_extensions.dart';
import 'package:delivery_app/core/components/custom_button.dart';
import 'package:delivery_app/core/constants/app_assets.dart';
import 'package:delivery_app/core/constants/app_colors.dart';
import 'package:delivery_app/core/constants/json_constants.dart';
import 'package:delivery_app/features/auth/view/signup.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/styles_constants.dart';
import 'components/custom_text_form_field.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) 
  {
    TextEditingController phoneController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    return Scaffold
    (
      backgroundColor: AppColors.blueColor,
      body: ListView
      (
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
        children: 
        [
          context.verticalSpace(0.1),
          Image.asset(AppAssets.logo1String, height: 100,),
          const Center(child: Text('QuickCart', style: StylesConsts.titleText)),
          const Center(child: Text('fast delivery app', style: StylesConsts.whiteTextXs)),
          32.spaceH,
          Text(JsonConstants.welcomeBack.t(context), style: StylesConsts.whiteTextLg),
          Text(JsonConstants.loginWithAccount.t(context), style: StylesConsts.whiteTextXs),
          16.spaceH,
          CustomTextFromField
          (
            controller: phoneController,
            label: JsonConstants.phone.t(context),
            type: TextInputType.phone,
          ),
          8.spaceH,
          CustomTextFromField
          (
            controller: passwordController,
            label: JsonConstants.password.t(context),
            type: TextInputType.visiblePassword,
          ),
          32.spaceH,
          CustomButton
          (
            title: JsonConstants.login.t(context), 
            onPressed: (){},
            color: context.theme.colorScheme.secondary,
          ),
          12.spaceH,
          Row(
            children: 
            [
              Text(JsonConstants.dontHaveAccount.t(context), style: StylesConsts.whiteTextXs,),
              12.spaceW,
              InkWell
              (
                child: Text(JsonConstants.createAccount.t(context), style: StylesConsts.yellowTextXs,),
                onTap: (){context.push(const SignupPage());},
              ),
            ],
          )
        ],
      ),
    );
  }
}
