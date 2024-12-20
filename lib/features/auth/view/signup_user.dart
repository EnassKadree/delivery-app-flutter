import 'package:delivery_app/core/Extensions/context_extension.dart';
import 'package:delivery_app/core/Extensions/space_extension.dart';
import 'package:delivery_app/core/Extensions/string_extensions.dart';
import 'package:delivery_app/core/components/custom_button.dart';
import 'package:delivery_app/core/constants/app_assets.dart';
import 'package:delivery_app/core/constants/app_colors.dart';
import 'package:delivery_app/core/constants/json_constants.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/styles_constants.dart';
import '../../../core/functions/functions.dart';
import 'components/custom_text_form_field.dart';
import 'signup_profile.dart';

class SignupUserPage extends StatelessWidget {
  const SignupUserPage({super.key});

  @override
  Widget build(BuildContext context) 
  {
    TextEditingController emailController = TextEditingController();
    TextEditingController phoneController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    return Scaffold
    (
      backgroundColor: AppColors.blueColor,
      body: ListView
      (
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
        children: Functions().staggeredList(
        [
          context.verticalSpace(0.1),
          Image.asset(AppAssets.logo1String, height: 100,),
          Center(child: Text(JsonConstants.quickCart.t(context), style: StylesConsts.titleText)),
          Center(child: Text(JsonConstants.fastDelivery.t(context), style: StylesConsts.whiteTextXs)),
          32.spaceH,
          Text(JsonConstants.createAccount.t(context), style: StylesConsts.whiteTextLg),
          16.spaceH,
          CustomTextFromField
          (
            controller: emailController,
            label: JsonConstants.email.t(context),
            type: TextInputType.emailAddress,
          ),
          8.spaceH,
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
            title: JsonConstants.createAccount.t(context), 
            onPressed: ()
            {
              context.push(const SignupProfilePage());
            },
            color: context.theme.colorScheme.secondary,
          ),
          12.spaceH,
          Row(
            children: 
            [
              Text(JsonConstants.haveAccount.t(context), style: StylesConsts.whiteTextXs,),
              12.spaceW,
              InkWell
              (
                child: Text(JsonConstants.login.t(context), style: StylesConsts.yellowTextXs,),
                onTap: (){context.pop();},
              ),
            ],
          )
        ]),
      ),
    );
  }
}
