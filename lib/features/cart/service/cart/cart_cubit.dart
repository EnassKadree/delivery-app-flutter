import 'package:delivery_app/core/base/base_cubit.dart';
import 'package:meta/meta.dart';

import '../../../../core/network/api.dart';
import '../../../../core/network/end_point.dart';
import '../../../app/model/user.dart';

part 'cart_state.dart';

class CartCubit extends BaseCubit<CartState> 
{
  CartCubit() : super(CartInitial());
    final String endPoint1 = '${EndPoint.baseUrl}${EndPoint.addToCart}';
    final String endPoint2 = '${EndPoint.baseUrl}${EndPoint.removeFromCart}';

  Future<void> addToCart(int productId) async
  {
    emit(CartLoading());

    await executeWithCatch
    (
      action: () async 
      {
        UserModel user = await requireUser();
        // ignore: missing_required_param
        Map<String, dynamic> response = await Api().post(url: '$endPoint1/$productId', token: user.token);
        emit(CartSuccess(response['message']));
      },
      emit: emit,
      failureStateBuilder: (message) => CartFailure(message),
    );
  }
  Future<void> removeFromCart (int productId) async
  {
    emit(CartLoading());

    await executeWithCatch
    (
      action: () async 
      {
        UserModel user = await requireUser();
        // ignore: missing_required_param
        Map<String, dynamic> response = await Api().delete(url: '$endPoint2/$productId', token: user.token);
        emit(CartSuccess(response['message']));
      },
      emit: emit,
      failureStateBuilder: (message) => CartFailure(message),
    );
  }
}
