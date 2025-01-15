import 'dart:async';

import 'package:flutter/material.dart';

import '../../../../Core/base/base_cubit.dart';
import '../../../../Core/network/api.dart';
import '../../../../Core/network/end_point.dart';
import '../../../app/data/data_source.dart';
import '../../../app/model/user.dart';

part 'register_state.dart';

class RegisterCubit extends BaseCubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  final String endPoint = '${EndPoint.baseUrl}${EndPoint.register}';

  final firstNameCon = TextEditingController();
  final lastNameCon = TextEditingController();
  final phoneCon = TextEditingController();
  final emailCon = TextEditingController();
  final passwordCon = TextEditingController();
  final passwordConfirmationCon = TextEditingController();
  final addressCon = TextEditingController();
  GlobalKey<FormState> formKey1 = GlobalKey<FormState>();
  GlobalKey<FormState> formKey2 = GlobalKey<FormState>();

  Future<void> register({
    required String firstName,
    required String lastName,
    required String phone,
    required String email,
    required String password,
    required String passwordConfirmation,
    required String address,
  }) async {
    emit(RegisterLoading());
    await executeWithCatch(
      
        action: () async { 
          // final prefs = await SharedPreferences.getInstance();
          // String? fcmToken = prefs.getString('fcm_token');
          Map<String, dynamic> body = {
            "first_name": firstName,
            "last_name": lastName,
            "email": email,
            "phone": phone,
            "password": password,
            "password_confirmation": passwordConfirmation,
            "address": address,
            // "fcm_token":fcmToken??" ",
            'fcm_token' : 'ex'
          };

          Map<String, dynamic> response =
              await Api().postWithoutTokenWithBody(url: endPoint, body: body);
          UserModel user =UserModel.fromJson(response);
          DataSource().saveUser(user);

          emit(RegisterSuccess(response));
        },
        emit: emit,
        failureStateBuilder: (message) => RegisterFailure(message));
  }
}
