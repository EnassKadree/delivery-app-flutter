import 'package:delivery_app/core/base/base_cubit.dart';
import 'package:delivery_app/core/network/api.dart';
import 'package:delivery_app/core/network/end_point.dart';
import 'package:delivery_app/features/app/model/user.dart';
import 'package:meta/meta.dart';

import '../../../app/model/order.dart';

part 'show_order_state.dart';

class ShowOrderCubit extends BaseCubit<ShowOrderState> {
  ShowOrderCubit() : super(ShowOrderInitial());
  final String endPoint = '${EndPoint.baseUrl}${EndPoint.orders}';

  Future<void> getOrders() async {
    emit(ShowOrderLoading());

    await executeWithCatch(
      action: () async {
        UserModel user = await requireUser();
        String url = endPoint;
        Map<String, dynamic> response =
            await Api().get(url: url, token: user.token);

        List<OrderModel> orders = parseResponse<OrderModel>(
          response: response,
          fromJson: (data) => OrderModel.fromJson(data),
          dataName: 'orders',
        );
        emit(ShowOrderSuccess(orders));
      },
      emit: emit,
      failureStateBuilder: (message) => ShowOrderFailure(message),
    );
  }
}
