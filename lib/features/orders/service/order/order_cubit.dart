import 'package:meta/meta.dart';

import '../../../../Core/base/base_cubit.dart';
import '../../../../Core/network/api.dart';
import '../../../../Core/network/end_point.dart';
import '../../../app/model/user.dart';

part 'order_state.dart';

class OrderCubit extends BaseCubit<OrderState> {
  OrderCubit() : super(OrderInitial());

  final String deleteEndPoint = '${EndPoint.baseUrl}${EndPoint.order}/delete';

  Future<void> deleteOrder (int orderId) async
  {
    emit(OrderLoading());

    await executeWithCatch
    (
      action: () async 
      {
        UserModel user = await requireUser();
        // ignore: missing_required_param
        Map<String, dynamic> response = await Api().delete(url: '$deleteEndPoint/$orderId', token: user.token);
        emit(OrderSuccess(response['message']));
      },
      emit: emit,
      failureStateBuilder: (message) => OrderFailure(message),
    );
  }
}
