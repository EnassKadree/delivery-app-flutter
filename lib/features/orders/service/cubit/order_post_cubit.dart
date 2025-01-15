import 'package:delivery_app/core/base/base_cubit.dart';
import 'package:delivery_app/core/network/api.dart';
import 'package:delivery_app/core/network/end_point.dart';
import 'package:delivery_app/features/app/model/user.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'order_post_state.dart';

class OrderPostCubit extends BaseCubit<OrderPostState> {
  OrderPostCubit() : super(OrderPostInitial());
  final String endPoint = '${EndPoint.baseUrl}${EndPoint.order}';

  final addressCon = TextEditingController();

  Future<void> postOrder({
    required String address,
  }) async {
    emit(OrderPostLoading());
    await executeWithCatch(
        action: () async {
          Map<String, dynamic> body = {
            "address": address,
          };
          UserModel user = await requireUser();
          Map<String, dynamic> response =
              await Api().post(url: endPoint, body: body, token: user.token);
          emit(OrderPostSuccess(response));
        },
        emit: emit,
        failureStateBuilder: (message) => OrderPostFailure(message));
  }
}
