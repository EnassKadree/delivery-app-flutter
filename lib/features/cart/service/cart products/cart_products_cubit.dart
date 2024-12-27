import 'package:delivery_app/features/app/model/user.dart';
import 'package:meta/meta.dart';

import '../../../../core/base/base_cubit.dart';
import '../../../../core/network/api.dart';
import '../../../../core/network/end_point.dart';
import '../../../app/model/cart.dart';

part 'cart_products_state.dart';

class CartProductsCubit extends BaseCubit<CartProductsState> {
  CartProductsCubit() : super(CartProductsInitial());
    final String endPoint = '${EndPoint.baseUrl}${EndPoint.cartProducts}';

  Future<void> getCart() async
  {
    emit(CartProductsLoading());

    await executeWithCatch
    (
      action: () async 
      {
        UserModel user = await requireUser();
        Map<String, dynamic> response = await Api().get(url: endPoint, token: user.token);

        CartModel cart = CartModel.fromJson(response);
        emit(CartProductsSuccess(cart));
      },
      emit: emit,
      failureStateBuilder: (message) => CartProductsFailure(message),
    );
  }
}
