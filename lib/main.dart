import 'package:delivery_app/features/app/model/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'core/localization/app_localization.dart';
import 'core/theme/theme.dart';
import 'features/app/data/data_source.dart';
import 'features/app/locale/locale_cubit.dart';
import 'features/app/theme/theme_cubit.dart';
import 'features/app/user/user_cubit.dart';

void main() async 
{
  WidgetsFlutterBinding.ensureInitialized();
  prefs = await SharedPreferences.getInstance();

  final UserModel? user = DataSource().getUser();
  final String? savedTheme = DataSource().getTheme();
  final String? savedLocale = DataSource().getLocale();
  final userCubit = UserCubit();

  if (user != null) {
    userCubit.login(user);
  }

  final locale = savedLocale != null ? Locale(savedLocale) : const Locale('ar');
  final theme = savedTheme == 'dark' ? Themes.dark : Themes.light;

  runApp(
    MultiBlocProvider
    (
      providers: 
      [
        BlocProvider(create: (context) => LocaleCubit(locale),),
        BlocProvider(create: (context) => ThemeCubit(theme),),
        BlocProvider(create: (context) => userCubit),
      ],
      child: const MyApp(),
    ),
  );
}

late SharedPreferences prefs;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        builder: (_, __) => BlocListener<LocaleCubit, Locale>(
          listener: (context, state) 
          {
            WidgetsBinding.instance.addPostFrameCallback((_) {
            });
          },
          child: BlocBuilder<ThemeCubit, Themes>(
            builder: (context, theme) {
              return BlocBuilder<LocaleCubit, Locale>(
                builder: (context, locale) {
                  return MaterialApp(
                    debugShowCheckedModeBanner: false,
                    theme: AppTheme.lightTheme,
                    themeMode: ThemeMode.light,
                    localizationsDelegates: const [
                      AppLocalizations.delegate,
                      GlobalMaterialLocalizations.delegate,
                      GlobalWidgetsLocalizations.delegate,
                      GlobalCupertinoLocalizations.delegate,
                    ],
                    supportedLocales: const [
                      Locale('ar', ''),
                      Locale('en', ''),
                    ],
                    localeResolutionCallback: (locale, supportedLocales) {
                      if (locale == null) return supportedLocales.first;
                      for (var supportedLocale in supportedLocales) {
                        if (supportedLocale.languageCode ==
                            locale.languageCode) {
                          return supportedLocale;
                        }
                      }
                      return supportedLocales.first;
                    },
                    locale: locale,
                    home: Builder(builder: (context) {
                      //setupLocator(context);
                      return const MyHomePage();
                    }),
                  );
                },
              );
            },
          ),
        ),
      );
  }
}


class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}