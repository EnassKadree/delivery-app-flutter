import '../../../../Core/base/base_cubit.dart';import 'package:flutter/material.dart';

class LocaleCubit extends BaseCubit<Locale> 
{
  LocaleCubit(super.initialState); 

  void changeLocale(Locale locale) {
    emit(locale);
  }
}