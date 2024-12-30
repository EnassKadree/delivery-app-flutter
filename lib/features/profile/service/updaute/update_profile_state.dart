part of 'update_profile_cubit.dart';

@immutable
sealed class UpdateProfileState {}

final class UpdateProfileInitial extends UpdateProfileState {}
class ProfileUpdateLoading extends UpdateProfileState {}

class ProfileUpdateSuccess extends UpdateProfileState {
  final Map<String, dynamic> response;
  ProfileUpdateSuccess(this.response);
}

class ProfileUpdateFailure extends UpdateProfileState {
  final String message;
  ProfileUpdateFailure(this.message);
}
