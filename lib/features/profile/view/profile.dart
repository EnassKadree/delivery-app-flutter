import 'package:delivery_app/core/Extensions/string_extensions.dart';
import 'package:delivery_app/core/Extensions/widget.extenstion.dart';
import 'package:delivery_app/features/profile/service/get_info/profile_cubit.dart';
import 'package:delivery_app/features/profile/service/updaute/update_profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/components/custom_button.dart';
import '../../../core/components/modal_progress_hud_nsn.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/json_constants.dart';
import '../../../core/functions/functions.dart';
import 'components/profile_body.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<UpdateProfileCubit>(context);
    return Scaffold(
      backgroundColor: AppColors.backGroundGreyColor,
      bottomNavigationBar: CustomButton(
        title: JsonConstants.upDate.t(context),
        onPressed: () async {
          if (cubit.formKey.currentState?.validate() ??
              false) {
            cubit.updateProfile(
                firstName: cubit.firstNameCon.text,
                lastName: cubit.lastNameCon.text,
                phone: cubit.phoneCon.text,
                address: cubit.addressCon.text, image: 'ii');
          }
        },
        //color: context.theme.colorScheme.secondary,
      ).mainPadding,
      body: BlocConsumer<ProfileCubit, ProfileState>(
        listener: (context, state) {
          if (state is ProfileFailure) {
              Functions().showAlertDialog(context, false, state.message);
          }
          if (state is ProfileSuccess) {
            cubit.firstNameCon.text = state.customer.firstName ?? '';
            cubit.lastNameCon.text = state.customer.lastName ?? '';
            cubit.addressCon.text = state.customer.address ?? '';
            cubit.phoneCon.text = state.customer.phone ?? '';
          }
        },
        builder: (context, state) {
          return CustomProgressIndicator(
              inAsyncCall: state is ProfileLoading, child: const ProfileBody());
        },
      ),
    );
  }
}

class ProfilePageWrapper extends StatelessWidget {
  const ProfilePageWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(
        create: (context) => ProfileCubit()..getUserInfo(),
      ),
      BlocProvider(
        create: (context) => UpdateProfileCubit()
      )
    ], child: const ProfilePage());
  }
}
