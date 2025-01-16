part of 'order_details_cubit.dart';

@immutable
sealed class OrderDetailsState {}

final class OrderDetailsInitial extends OrderDetailsState {}
final class OrderDetailsLoading extends OrderDetailsState {}
final class OrderDetailsFailure extends OrderDetailsState 
{
  final String message;

  OrderDetailsFailure(this.message);
}
final class OrderDetailsSuccess extends OrderDetailsState 
{
  final OrderDetailsModel order;

  OrderDetailsSuccess(this.order);
}
