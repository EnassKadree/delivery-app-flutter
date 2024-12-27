part of 'favorite_cubit.dart';

@immutable
sealed class FavoriteState {}

final class FavoriteInitial extends FavoriteState {}
final class FavoriteLoading extends FavoriteState {}
final class FavoriteSuccess extends FavoriteState 
{
  final String message;

  FavoriteSuccess(this.message);
}
final class FavoriteFailure extends FavoriteState 
{
  final String message;

  FavoriteFailure(this.message);
}
