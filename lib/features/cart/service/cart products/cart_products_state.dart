part of 'cart_products_cubit.dart';

@immutable
sealed class CartProductsState {}

final class CartProductsInitial extends CartProductsState {}
final class CartProductsLoading extends CartProductsState {}
final class CartProductsSuccess extends CartProductsState 
{
  final CartModel cart;

  CartProductsSuccess(this.cart);
}
final class CartProductsFailure extends CartProductsState 
{
  final String message;

  CartProductsFailure(this.message);
}
