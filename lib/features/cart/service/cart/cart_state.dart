part of 'cart_cubit.dart';

@immutable
sealed class CartState {}

final class CartInitial extends CartState {}
final class CartLoading extends CartState {}
final class CartSuccess extends CartState 
{
  final String message;

  CartSuccess(this.message);
}
final class CartFailure extends CartState 
{
  final String message;

  CartFailure(this.message);
}
