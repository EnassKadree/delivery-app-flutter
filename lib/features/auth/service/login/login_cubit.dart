// import 'package:albasheer/Features/app/data%20source/user_data_source.dart';
// import 'package:flutter/material.dart';
// import 'package:meta/meta.dart';

// import '../../../../Core/base/base_cubit.dart';
// import '../../../../Core/network/api.dart';
// import '../../../../Core/network/end_point.dart';
// import '../../../app/model/user.dart';

// part 'login_state.dart';

// class LoginCubit extends BaseCubit<LoginState> {
//   LoginCubit() : super(LoginInitial());

//   final String endPoint = '${EndPoint.baseUrl}${EndPoint.login}';
    
//   final usernameCon = TextEditingController();
//   final passwordCon = TextEditingController();
//   GlobalKey<FormState> formKey = GlobalKey<FormState>();

//   Future<void> login({required String username,required String password}) async 
//   {
//     emit(LoginLoading()); 

//     await executeWithCatch
//     (
//       action: () async
//       {
//         Map<String, dynamic> body = 
//         {
//           'username' : username,
//           'password' : password,
//         };

//       Map<String,dynamic> response = await Api().postWithoutTokenWithBody(url: endPoint, body: body);
//       User user = User.fromJson(response['data']);
//       UserDataSource().saveUser(user);
//       emit(LoginSuccess(user));
//       }, 
//       emit: emit, 
//       failureStateBuilder: (message) => LoginFailure(message)
//     );
//   }
// }
