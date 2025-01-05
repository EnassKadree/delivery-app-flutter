part of 'profile_cubit.dart';

@immutable
sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}

final class ProfileSuccess extends ProfileState {
  final CustomerModel customer;
  ProfileSuccess(this.customer );
}

final class ProfileLoading extends ProfileState {}

final class ProfileFailure extends ProfileState {
  final String message;

  ProfileFailure(this.message);
}
