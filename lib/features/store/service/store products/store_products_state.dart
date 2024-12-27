part of 'store_products_cubit.dart';

@immutable
sealed class StoreProductsState {}

final class StoreProductsInitial extends StoreProductsState {}
final class StoreProductsLoading extends StoreProductsState {}
final class StoreProductsSuccess extends StoreProductsState 
{
  final List<ProductModel> products;

  StoreProductsSuccess(this.products);
}
final class StoreProductsFailure extends StoreProductsState 
{
  final String message;

  StoreProductsFailure(this.message);
}
