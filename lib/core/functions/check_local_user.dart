part of 'functions.dart';

extension CheckLocalUser on Functions
{
  UserCubit checkLocalUser() 
  {
    final UserModel? user = DataSource().getUser();
    final userCubit = UserCubit();
    
    if (user != null) {
      userCubit.login(user);
    }
    return userCubit;
  }
}