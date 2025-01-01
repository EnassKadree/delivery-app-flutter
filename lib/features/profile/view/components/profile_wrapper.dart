
import 'package:delivery_app/core/components/modal_progress_hud_nsn.dart';
import 'package:delivery_app/core/constants/app_colors.dart';
import 'package:delivery_app/core/functions/functions.dart';
import 'package:delivery_app/features/profile/service/get_info/profile_cubit.dart';
import 'package:delivery_app/features/profile/service/updaute/update_profile_cubit.dart';
import 'package:delivery_app/features/profile/view/components/profile_body.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileWrapper extends StatelessWidget {
  const ProfileWrapper({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<UpdateProfileCubit>(context);
    return Scaffold(
      backgroundColor: AppColors.backGroundGreyColor,
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
              inAsyncCall: state is ProfileLoding, child: const ProfileBody());
        },
      ),
    );
  }
}
