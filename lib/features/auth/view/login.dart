import 'package:delivery_app/core/Extensions/context_extension.dart';
import 'package:delivery_app/core/Extensions/space_extension.dart';
import 'package:delivery_app/core/Extensions/string_extensions.dart';
import 'package:delivery_app/core/components/custom_button.dart';
import 'package:delivery_app/core/components/modal_progress_hud_nsn.dart';
import 'package:delivery_app/core/constants/app_assets.dart';
import 'package:delivery_app/core/constants/app_colors.dart';
import 'package:delivery_app/core/constants/json_constants.dart';
import 'package:delivery_app/core/functions/functions.dart';
import 'package:delivery_app/features/auth/service/login/login_cubit.dart';
import 'package:delivery_app/features/home/view/home_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/constants/styles_constants.dart';
import 'components/custom_text_form_field.dart';
import 'signup_user.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) 
  {
    final cubit = context.read<LoginCubit>();
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) 
      {
        if(state is LoginSuccess)
        {
          context.pushAndRemoveAll(const HomeLayoutWrapper());
        }
        if(state is LoginFailure)
        {
          Functions().showAlertDialog(context, false, state.message);
        }
      },
      builder: (context, state) 
      {
        return CustomProgressIndicator
        (
          inAsyncCall: state is LoginLoading,
          child: Scaffold(
            backgroundColor: AppColors.blueColor,
            body: ListView(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
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
                Text(JsonConstants.welcomeBack.t(context),
                    style: StylesConsts.whiteTextLg),
                Text(JsonConstants.loginWithAccount.t(context),
                    style: StylesConsts.whiteTextXs),
                16.spaceH,
                CustomTextFromField(
                  controller: cubit.emailCon,
                  label: JsonConstants.email.t(context),
                  type: TextInputType.emailAddress,
                ),
                8.spaceH,
                CustomTextFromField(
                  controller: cubit.phoneCon,
                  label: JsonConstants.phone.t(context),
                  type: TextInputType.phone,
                ),
                8.spaceH,
                CustomTextFromField(
                  controller: cubit.passwordCon,
                  label: JsonConstants.password.t(context),
                  type: TextInputType.visiblePassword,
                ),
                32.spaceH,
                CustomButton(
                  title: JsonConstants.login.t(context),
                  onPressed: () 
                  {
                    cubit.login
                    (
                      phone: cubit.phoneCon.text,
                      email: cubit.emailCon.text, 
                      password: cubit.passwordCon.text
                    );
                  },
                  color: context.theme.colorScheme.secondary,
                ),
                12.spaceH,
                Row(
                  children: [
                    Text(
                      JsonConstants.dontHaveAccount.t(context),
                      style: StylesConsts.whiteTextXs,
                    ),
                    12.spaceW,
                    InkWell(
                      child: Text(
                        JsonConstants.createAccount.t(context),
                        style: StylesConsts.yellowTextXs,
                      ),
                      onTap: () {
                        context.push(const SignupUserPage());
                      },
                    ),
                  ],
                )
              ]),
            ),
          ),
        );
      },
    );
  }
}

class LoginPageWrapper extends StatelessWidget {
  const LoginPageWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider
    (
      providers: 
      [
        BlocProvider(create: (context) => LoginCubit())
      ], 
      child: const LoginPage()
    );
  }
}