part of 'functions.dart';

extension InputValidator on  Functions
{
  String? nameValidator(String? value, BuildContext context) 
  {
    if (value == null || value.isEmpty) {
      return 'الحقل مطلوب';
    } else if (value.length < 8) {
      return 'الاسم قصير جداً';
    } else if (value.length > 50) {
      return 'الاسم طويل جداً';
    } else {
      return null;
    }
  }

String? usernameValidator(String? value, BuildContext context) 
{
  final RegExp usernameRegex = RegExp(r'^[a-z0-9]+([_.-][a-z0-9]+)*$');

  if (value == null || value.trim().isEmpty) {
    return 'الحقل مطلوب';
  } else if (value.length < 5 || value.length > 50) {
    return 'يجب أن يكون اسم المستخدم بين 5 و 50 حرفًا';
  } else if (!usernameRegex.hasMatch(value.trim())) {
    return 'صيغة اسم المستخدم غير صحيحة';
  } else {
    return null;
  }
}

  String? passwordValidator(String? value, BuildContext context) 
  {
    if (value == null || value.isEmpty) {
      return 'الحقل مطلوب';
    } else if (value.length < 8) {
      return 'كلمة السر قصيرة جداً';
    } else if (value.length > 20) {
      return 'كلمة السر طويلة جداً';
    } else {
      return null;
    }
  }

  String? phoneValidator(String? value, BuildContext context) 
  {
    final RegExp phoneRegex = RegExp(
      r"^(?:\+963|00963|0)?9\s?\d{3}\s?\d{3}\s?\d{2}$|^(?:\+963|00963|0)?(1[1-9]|2[1-9]|3[1-9]|4[1-3])\s?\d{2,3}\s?\d{2,3}\s?\d{2}$"
    );
    
    if (value == null || value.isEmpty) {
      return 'الحقل مطلوب';
    } 
    else if (!phoneRegex.hasMatch(value.replaceAll(RegExp(r'\s'), ''))) {
      return 'صيغة الهاتف غير صحيحة';
    } 
    else {
      return null;
    }
  }
}
