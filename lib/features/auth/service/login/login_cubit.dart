import 'package:delivery_app/features/app/data/data_source.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../Core/base/base_cubit.dart';
import '../../../../Core/network/api.dart';
import '../../../../Core/network/end_point.dart';
import '../../../app/model/user.dart';

part 'login_state.dart';

class LoginCubit extends BaseCubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  final String endPoint = '${EndPoint.baseUrl}${EndPoint.login}';
    
  final phoneCon = TextEditingController();
  final emailCon = TextEditingController();
  final passwordCon = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future<void> login({required String phone, required String email, required String password}) async 
  {
    emit(LoginLoading()); 

    await executeWithCatch
    (
      action: () async
      {  final prefs = await SharedPreferences.getInstance();
      String? fcmToken = prefs.getString('fcm_token');
        Map<String, dynamic> body = 
        {
          'phone' : phone,
          'password' : password,
          'email' : email,
        //  "fcm_token":fcmToken
        };

      Map<String,dynamic> response = await Api().postWithoutTokenWithBody(url: endPoint, body: body);
      UserModel user =UserModel.fromJson(response);
      DataSource().saveUser(user);
      emit(LoginSuccess(user));
      }, 
      emit: emit, 
      failureStateBuilder: (message) => LoginFailure(message)
    );
  }
}
