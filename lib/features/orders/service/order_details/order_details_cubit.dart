import 'package:meta/meta.dart';

import '../../../../Core/base/base_cubit.dart';
import '../../../../Core/network/api.dart';
import '../../../../Core/network/end_point.dart';
import '../../../app/model/order_details.dart';
import '../../../app/model/user.dart';

part 'order_details_state.dart';

class OrderDetailsCubit extends BaseCubit<OrderDetailsState> {
  OrderDetailsCubit() : super(OrderDetailsInitial());
    final String endPoint = '${EndPoint.baseUrl}${EndPoint.orders}';

  Future<void> getOrders(int orderId) async {
    emit(OrderDetailsLoading());

    await executeWithCatch(
      action: () async {
        UserModel user = await requireUser();
        String url = '$endPoint/$orderId';
        Map<String, dynamic> response =
            await Api().get(url: url, token: user.token);

        OrderDetailsModel orders = OrderDetailsModel.fromJson(response);
        emit(OrderDetailsSuccess(orders));
      },
      emit: emit,
      failureStateBuilder: (message) => OrderDetailsFailure(message),
    );
  }
}
