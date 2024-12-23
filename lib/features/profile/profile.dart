import 'package:delivery_app/core/Extensions/context_extension.dart';
import 'package:delivery_app/core/Extensions/space_extension.dart';
import 'package:delivery_app/core/Extensions/string_extensions.dart';
import 'package:delivery_app/core/components/custom_button.dart';
import 'package:delivery_app/core/constants/app_colors.dart';
import 'package:delivery_app/core/constants/json_constants.dart';
import 'package:delivery_app/features/auth/view/components/custom_text_form_field.dart';
import 'package:delivery_app/features/profile/app_bar_profile.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController firstNameController = TextEditingController();
    TextEditingController lastNameController = TextEditingController();
    TextEditingController addressController = TextEditingController();
    TextEditingController phoneController = TextEditingController();
    return Scaffold(
      backgroundColor: AppColors.backGroundGreyColor,
      body: Column(
        children: [
          const AppBarProfile(),
          60.spaceH,
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                CustomTextFromField(
                  controller: firstNameController,
                  label: JsonConstants.firstName.t(context),
                  type: TextInputType.name,
                ),
                12.spaceH,
                CustomTextFromField(
                  controller: lastNameController,
                  label: JsonConstants.lastName.t(context),
                  type: TextInputType.name,
                ),
                12.spaceH,
                CustomTextFromField(
                  controller: addressController,
                  label: JsonConstants.address.t(context),
                  type: TextInputType.name,
                ),
                12.spaceH,
                CustomTextFromField(
                  controller: phoneController,
                  label: JsonConstants.phone.t(context),
                  type: TextInputType.phone,
                  readOnly: true,
                ),
                32.spaceH,
                CustomButton(
                  title: JsonConstants.upDate.t(context),
                  onPressed: () {},
                  color: context.theme.colorScheme.secondary,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
