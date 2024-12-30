import 'package:delivery_app/core/Extensions/context_extension.dart';
import 'package:delivery_app/core/Extensions/space_extension.dart';
import 'package:delivery_app/core/Extensions/string_extensions.dart';
import 'package:delivery_app/core/components/custom_button.dart';
import 'package:delivery_app/core/components/modal_progress_hud_nsn.dart';
import 'package:delivery_app/core/constants/json_constants.dart';
import 'package:delivery_app/core/functions/functions.dart';
import 'package:delivery_app/features/auth/view/components/custom_text_form_field.dart';
import 'package:delivery_app/features/profile/service/updaute/update_profile_cubit.dart';
import 'package:delivery_app/features/profile/view/components/app_bar_profile.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<UpdateProfileCubit>(context);
    return BlocConsumer<UpdateProfileCubit, UpdateProfileState>(
      listener: (context, state) {
        if (state is ProfileUpdateSuccess) {
          Functions().showAlertDialog(
              context, true, JsonConstants.modifiedSuccessfully.t(context));
        }
        if (state is ProfileUpdateFailure) {
        //  Functions().showAlertDialog(context, false, state.message);
          print(state.message);
        }
      },
      builder: (context, state) {
        return CustomProgressIndicator(
          inAsyncCall: state is ProfileUpdateLoading,
          child: Form(
            key: cubit.formKey,
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: Functions().staggeredList(
                [
                  const AppBarProfile(),
                  60.spaceH,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Column(
                      children: <Widget>[
                        CustomTextFromField(
                          controller: cubit.firstNameCon,
                          label: JsonConstants.firstName.t(context),
                          type: TextInputType.name,
                        ),
                        12.spaceH,
                        CustomTextFromField(
                          controller: cubit.lastNameCon,
                          label: JsonConstants.lastName.t(context),
                          type: TextInputType.name,
                        ),
                        12.spaceH,
                        CustomTextFromField(
                          controller: cubit.addressCon,
                          label: JsonConstants.address.t(context),
                          type: TextInputType.name,
                        ),
                        12.spaceH,
                        CustomTextFromField(
                          controller: cubit.phoneCon,
                          label: JsonConstants.phone.t(context),
                          type: TextInputType.phone,
                          readOnly: true,
                        ),
                        32.spaceH,
                        CustomButton(
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
                          color: context.theme.colorScheme.secondary,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}