import 'package:delivery_app/core/Extensions/context_extension.dart';
import 'package:delivery_app/core/Extensions/space_extension.dart';
import 'package:delivery_app/core/Extensions/string_extensions.dart';
import 'package:delivery_app/core/components/custom_button.dart';
import 'package:delivery_app/core/components/modal_progress_hud_nsn.dart';
import 'package:delivery_app/core/constants/app_assets.dart';
import 'package:delivery_app/core/constants/app_colors.dart';
import 'package:delivery_app/core/constants/json_constants.dart';
import 'package:delivery_app/features/auth/service/register/register_cubit.dart';
import 'package:delivery_app/features/home/view/home_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/constants/styles_constants.dart';
import '../../../core/functions/functions.dart';
import 'components/custom_text_form_field.dart';

class SignupProfilePage extends StatelessWidget {
  const SignupProfilePage({super.key, required this.cubit});
  final RegisterCubit cubit;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (BuildContext context, RegisterState state) {
        if (state is RegisterSuccess) {
          
          context.pushAndRemoveAll(const HomeLayoutWrapper());
        }
      },
      builder: (context, state) {
        return CustomProgressIndicator(
            inAsyncCall: state is RegisterLoading,
            child: Scaffold(
              backgroundColor: AppColors.blueColor,
              body: Form(
                key: cubit.formKey2,
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                  children: Functions().staggeredList([
                    context.verticalSpace(0.1),
                    Image.asset(
                      AppAssets.logo1String,
                      height: 100,
                    ),
                    Center(
                        child: Text(JsonConstants.quickCart.t(context),
                            style: StylesConsts.titleText)),
                    Center(
                        child: Text(JsonConstants.fastDelivery.t(context),
                            style: StylesConsts.whiteTextXs)),
                    32.spaceH,
                    Text(JsonConstants.profileInfo.t(context),
                        style: StylesConsts.whiteTextLg),
                    16.spaceH,
                    CustomTextFromField(
                      controller: cubit.firstNameCon,
                      label: JsonConstants.firstName.t(context),
                      type: TextInputType.name,
                    ),
                    8.spaceH,
                    CustomTextFromField(
                      controller: cubit.lastNameCon,
                      label: JsonConstants.lastName.t(context),
                      type: TextInputType.name,
                    ),
                    8.spaceH,
                    CustomTextFromField(
                      controller: cubit.addressCon,
                      label: JsonConstants.address.t(context),
                      type: TextInputType.name,
                    ),
                    32.spaceH,
                    CustomButton(
                      title: JsonConstants.register.t(context),
                      onPressed: () async {
                        if (cubit.formKey2.currentState!.validate()) {
                          cubit.register(
                              firstName: cubit.firstNameCon.text,
                              lastName: cubit.lastNameCon.text,
                              phone: cubit.phoneCon.text,
                              email: cubit.emailCon.text,
                              password: cubit.passwordCon.text,
                              address: cubit.addressCon.text);
                        }
                        //  Functions().showAlertDialog(context, true, "jl");
                      },
                      color: context.theme.colorScheme.secondary,
                    ),
                  ]),
                ),
              ),
            ));
      },
    );
  }
}
