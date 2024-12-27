part of 'category_products_cubit.dart';

@immutable
sealed class CategoryProductsState {}

final class CategoryProductsInitial extends CategoryProductsState {}
final class CategoryProductsLoading extends CategoryProductsState {}
final class CategoryProductsSuccess extends CategoryProductsState 
{
  final List<ProductModel> products;

  CategoryProductsSuccess(this.products);
}
final class CategoryProductsFailure extends CategoryProductsState 
{
  final String message;

  CategoryProductsFailure(this.message);
}
