part of 'check_order_cubit.dart';

@immutable
sealed class CheckOrderState {}

final class CheckOrderInitial extends CheckOrderState {}
class CheckOrderLoading extends CheckOrderState {}

class CheckOrderSuccess extends CheckOrderState {
  final Map<String, dynamic> response;
  CheckOrderSuccess(this.response);
}

class CheckOrderFailure extends CheckOrderState {
  final String message;
 CheckOrderFailure(this.message);
}
