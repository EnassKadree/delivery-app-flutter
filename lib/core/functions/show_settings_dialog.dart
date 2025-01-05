part of 'functions.dart';

extension ShowSettingsDialog on Functions
{
  Future<dynamic> showSettingsDialog(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) {
      return Dialog(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        alignment: AlignmentDirectional.topStart,
        child: Container(
          width: 80,
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: Text(
                  JsonConstants.darkMode.t(context),
                  style: StylesConsts.darkTextSm
                ),
                leading: const Icon(Icons.dark_mode_outlined),
                trailing: BlocBuilder<ThemeCubit, Themes>(
                  builder: (context, theme) {
                    bool isDark = theme == Themes.dark;
                    return Switch(
                        activeColor: AppColors.blueColor,
                        inactiveThumbColor: AppColors.white,
                        activeTrackColor:
                            AppColors.lightYellowColor,
                        inactiveTrackColor: AppColors.greyColor,
                        value: isDark,
                        onChanged: (value) async
                        {
                          Themes newTheme =
                              isDark ? Themes.light : Themes.dark;
                          context.read<ThemeCubit>().changeTheme(newTheme);
                          DataSource().saveTheme(newTheme == Themes.light? 'light' : 'dark');
                        });
                  },
                ),
              ),
              BlocBuilder<LocaleCubit, Locale>(
                builder: (context, locale) 
                {
                  bool isEnglish = locale == const Locale('en');
                  return ListTile(
                    title: Text(
                      JsonConstants.language.t(context),
                      style: StylesConsts.darkTextSm,
                    ),
                    subtitle:
                        Text(JsonConstants.currentLanguage.t(context)),
                    leading: const Icon(Icons.language_outlined),
                    onTap: () async
                    {
                      Locale newLocale = isEnglish? const Locale('ar') : const Locale('en');
                      context.read<LocaleCubit>().changeLocale(newLocale);
                      DataSource().saveLocale(newLocale);
                    },
                  );
                },
              ),
              ListTile(
                title: Text(
                  JsonConstants.logout.t(context),
                  style: StylesConsts.darkTextSm.copyWith(color: AppColors.errorColor)
                ),
                leading:
                    Icon(Iconsax.logout, color: AppColors.errorColor),
                onTap: () {
                  context.read<UserCubit>().logout();
                  context.pushAndRemoveAll(const LoginPageWrapper());
                },
              ),
            ],
          ),
        ),
      );
    });
  }
}
