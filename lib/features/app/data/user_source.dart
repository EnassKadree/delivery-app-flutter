part of 'data_source.dart';

extension UserSource on DataSource
{
  void saveUser(UserModel user)  
  {
    final userJson = jsonEncode(user.toJson());
    prefs.setString(DataSource._userKey, userJson);
  }

  UserModel? getUser()  
  {
    final userJsonString = prefs.getString(DataSource._userKey); 

    if (userJsonString != null) 
    {
      final Map<String, dynamic> userMap = jsonDecode(userJsonString); 
      return UserModel.fromJson(userMap); 
    }

    return null;
  }

  void clearUser()  
  {
    prefs.remove(DataSource._userKey);
  }
}