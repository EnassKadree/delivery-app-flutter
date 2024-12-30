import 'dart:io';

import 'package:delivery_app/core/network/api.dart';
import 'package:delivery_app/core/network/end_point.dart';
import 'package:delivery_app/features/app/model/customer.dart';
import 'package:delivery_app/features/app/model/user.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import '../../../../core/base/base_cubit.dart';
part 'profile_state.dart';

class ProfileCubit extends BaseCubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());
  final String endPoint = '${EndPoint.baseUrl}${EndPoint.userInfo}';

  Future<void> getUserInfo() async {
    emit(ProfileLoding());

    await executeWithCatch(
      action: () async {
        UserModel user = await requireUser();
        Map<String, dynamic> response = await Api().get(
          url: endPoint,
          token: user.token,
        );
        CustomerModel customer = CustomerModel.fromJson(response['customer']);
        emit(ProfileSuccess(customer));
      },
      emit: emit,
      failureStateBuilder: (message) => ProfileFailure(message),
    );
  }
}
