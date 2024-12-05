import '../../../../Core/base/base_cubit.dart';

import '../data/data_source.dart';
import '../model/user.dart';

class UserCubit extends BaseCubit<UserModel?> 
{
  UserCubit() : super(null);

  void login(UserModel user) 
  {
    DataSource().saveUser(user);
    emit(user);
  }

  void logout() 
  {
    DataSource().clearUser();
    emit(null);
  }
}
