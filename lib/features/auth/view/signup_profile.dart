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

class SignupProfilePage extends StatelessWidget {
  const SignupProfilePage({super.key});

  @override
  Widget build(BuildContext context) 
  {
    TextEditingController firstNameController = TextEditingController();
    TextEditingController lastNameController = TextEditingController();
    TextEditingController addressController = TextEditingController();
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
          Text(JsonConstants.profileInfo.t(context), style: StylesConsts.whiteTextLg),
          16.spaceH,
          CustomTextFromField
          (
            controller: firstNameController,
            label: JsonConstants.firstName.t(context),
            type: TextInputType.name,
          ),
          8.spaceH,
          CustomTextFromField
          (
            controller: lastNameController,
            label: JsonConstants.lastName.t(context),
            type: TextInputType.name,
          ),
          8.spaceH,
          CustomTextFromField
          (
            controller: addressController,
            label: JsonConstants.address.t(context),
            type: TextInputType.name,
          ),
          32.spaceH,
          CustomButton
          (
            title: JsonConstants.register.t(context), 
            onPressed: (){},
            color: context.theme.colorScheme.secondary,
          ),
        ]),
      ),
    );
  }
}
