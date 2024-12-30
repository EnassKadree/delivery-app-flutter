import 'dart:io';

import 'package:delivery_app/core/base/base_cubit.dart';
import 'package:delivery_app/core/network/api.dart';
import 'package:delivery_app/core/network/end_point.dart';
import 'package:delivery_app/features/app/model/user.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

part 'update_profile_state.dart';

class UpdateProfileCubit extends BaseCubit<UpdateProfileState> {
  UpdateProfileCubit() : super(UpdateProfileInitial());
  final String endPoint = '${EndPoint.baseUrl}${EndPoint.updateProfile}';

  final firstNameCon = TextEditingController();
  final lastNameCon = TextEditingController();
  final phoneCon = TextEditingController();
  final addressCon = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future<void> updateProfile({
    required String firstName,
    required String lastName,
    required String phone,
    required String address,
    required String image,
  }) async {
    emit(ProfileUpdateLoading());
    await executeWithCatch(
        action: () async {
          Map<String, dynamic> body = {
            "first_name": firstName,
            "last_name": lastName,
            "phone": phone,
            "address": address,
            "image":image
          };
          UserModel user = await requireUser();
          Map<String, dynamic> response =
              await Api().post(url: endPoint, body: body, token: user.token);
          emit(ProfileUpdateSuccess(response));
        },
        emit: emit,
        failureStateBuilder: (message) => ProfileUpdateFailure(message));
  }
}
