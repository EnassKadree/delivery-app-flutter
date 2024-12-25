part of 'stores_cubit.dart';

@immutable
sealed class StoresState {}

final class StoresInitial extends StoresState {}
final class StoresLoading extends StoresState {}
final class StoresSuccess extends StoresState 
{
  final List<StoreModel> stores;

  StoresSuccess(this.stores);
}
final class StoresFailure extends StoresState 
{
  final String message;

  StoresFailure(this.message);
}
