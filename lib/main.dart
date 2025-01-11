import 'package:delivery_app/core/base/local_notifications_service.dart';
import 'package:delivery_app/core/base/push_notifications_service.dart';
import 'package:delivery_app/core/functions/functions.dart';
import 'package:delivery_app/features/app/model/user.dart';
import 'package:delivery_app/features/auth/service/register/register_cubit.dart';
import 'package:delivery_app/features/cart/service/cart/cart_cubit.dart';
import 'package:delivery_app/features/profile/service/get_info/profile_cubit.dart';
import 'package:delivery_app/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
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
import 'features/favourite/service/favorite/favorite_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
    await Future.wait([
    PushNotificationsService.init(),
    LocalNotificationService.init(),
  ]);

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
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LocaleCubit(locale),
        ),
        BlocProvider(
          create: (context) => ThemeCubit(theme),
        ),
        BlocProvider(create: (context) => userCubit),
        BlocProvider(create: (context) => RegisterCubit()),
        BlocProvider(create: (context) => CartCubit()),
        BlocProvider(create: (context) => FavoriteCubit()),
        BlocProvider(create: (context) => ProfileCubit()),
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
        listener: (context, state) {
          WidgetsBinding.instance.addPostFrameCallback((_) {});
        },
        child: BlocBuilder<ThemeCubit, Themes>(
          builder: (context, theme) {
            return BlocBuilder<LocaleCubit, Locale>(
              builder: (context, locale) {
                return MaterialApp(
                  debugShowCheckedModeBanner: false,
                  theme: AppTheme.lightTheme,
                  darkTheme: AppTheme.darkTheme,
                  themeMode:
                      theme == Themes.dark ? ThemeMode.dark : ThemeMode.light,
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
                      if (supportedLocale.languageCode == locale.languageCode) {
                        return supportedLocale;
                      }
                    }
                    return supportedLocales.first;
                  },
                  locale: locale,
                  home: Builder(builder: (context) {
                    //setupLocator(context);
                    return Functions().buildHomeScreen();
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
