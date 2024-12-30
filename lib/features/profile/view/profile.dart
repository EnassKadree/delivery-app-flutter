import 'package:delivery_app/features/profile/service/get_info/profile_cubit.dart';
import 'package:delivery_app/features/profile/service/updaute/update_profile_cubit.dart';
import 'package:delivery_app/features/profile/view/components/profile_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController firstNameController = TextEditingController();
    TextEditingController lastNameController = TextEditingController();
    TextEditingController addressController = TextEditingController();
    TextEditingController phoneController = TextEditingController();
    return MultiBlocProvider(providers: [
      BlocProvider(
        create: (context) => ProfileCubit()..getUserInfo(),
      ),
      BlocProvider(
        create: (context) => UpdateProfileCubit()
          ..updateProfile(
              firstName: firstNameController.text,
              lastName: lastNameController.text,
              phone: phoneController.text,
              address: addressController.text, image: 'null'),
      )
    ], child: const ProfileWrapper());
  }
}
