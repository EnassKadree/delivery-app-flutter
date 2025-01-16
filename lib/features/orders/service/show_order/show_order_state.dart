part of 'show_order_cubit.dart';

@immutable
sealed class ShowOrderState {}

final class ShowOrderInitial extends ShowOrderState {}

final class ShowOrderLoading extends ShowOrderState {}

final class ShowOrderSuccess extends ShowOrderState {
  final List<OrderDetailsModel> orders;

  ShowOrderSuccess(this.orders);
}

final class ShowOrderFailure extends ShowOrderState {
  final String message;

  ShowOrderFailure(this.message);
}
