part of 'favorite_products_cubit.dart';

@immutable
sealed class FavoriteProductsState {}

final class FavoriteProductsInitial extends FavoriteProductsState {}
final class FavoriteProductsLoading extends FavoriteProductsState {}
final class FavoriteProductsSuccess extends FavoriteProductsState 
{
  final List<ProductModel> products;

  FavoriteProductsSuccess(this.products);
}
final class FavoriteProductsFailure extends FavoriteProductsState 
{
  final String message;

  FavoriteProductsFailure(this.message);
}
