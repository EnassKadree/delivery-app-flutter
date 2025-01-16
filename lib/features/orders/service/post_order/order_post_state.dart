part of 'order_post_cubit.dart';

@immutable
sealed class OrderPostState {}

final class OrderPostInitial extends OrderPostState {}

class OrderPostLoading extends OrderPostState {}

class OrderPostSuccess extends OrderPostState {
  final Map<String, dynamic> response;
  OrderPostSuccess(this.response);
}

class OrderPostFailure extends OrderPostState {
  final String message;
  OrderPostFailure(this.message);
}
