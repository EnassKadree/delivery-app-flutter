part of 'functions.dart';

extension BuildHomeScreen on Functions {
  Builder buildHomeScreen() {
    return Builder(builder: (context) {
      final user = context.read<UserCubit>().state;
      if (user != null) {
        return const HomeLayoutWrapper();
      } else {
        return const LoginPageWrapper();
      }
    });
  }
}
