import 'package:delivery_app/core/base/base_cubit.dart';
import 'package:delivery_app/core/network/api.dart';
import 'package:delivery_app/core/network/end_point.dart';
import 'package:delivery_app/features/app/model/order.dart';
import 'package:delivery_app/features/app/model/user.dart';
import 'package:meta/meta.dart';

part 'orders_state.dart';

class OrdersCubit extends BaseCubit<OrdersState> {
  OrdersCubit() : super(OrdersInitial());
  final String endPoint = '${EndPoint.baseUrl}${EndPoint.orders}';
  

  Future<void> getOrders([String? searchString]) async
  {
    emit(OrdersLoading());

    await executeWithCatch
    (
      action: () async 
      {
        UserModel user = await requireUser();
      
        Map<String, dynamic> response =
            await Api().get(url: endPoint, token: user.token);


        List<OrderModel> stores = parseResponse<OrderModel>
        (
          response: response,
          fromJson: (data) => OrderModel.fromJson(data),
          dataName: 'orders'
        );
        emit(OrdersSuccess(stores));
      },
      emit: emit,
      failureStateBuilder: (message) => OrdersFailure(message),
    );
  }
}


