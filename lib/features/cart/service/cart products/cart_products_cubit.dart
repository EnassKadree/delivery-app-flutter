import 'package:delivery_app/features/app/model/product.dart';
import 'package:delivery_app/features/app/model/user.dart';
import 'package:meta/meta.dart';

import '../../../../core/base/base_cubit.dart';
import '../../../../core/network/api.dart';
import '../../../../core/network/end_point.dart';

part 'cart_products_state.dart';

class CartProductsCubit extends BaseCubit<CartProductsState> {
  CartProductsCubit() : super(CartProductsInitial());
    final String endPoint = '${EndPoint.baseUrl}${EndPoint.cartProducts}';

  Future<void> getProducts() async
  {
    emit(CartProductsLoading());

    await executeWithCatch
    (
      action: () async 
      {
        UserModel user = await requireUser();
        Map<String, dynamic> response = await Api().get(url: endPoint, token: user.token);

        List<ProductModel> products = parseResponse<ProductModel>
        (
          response: response,
          fromJson: (data) => ProductModel.fromJson(data),
          dataName: 'products'
        );
        emit(CartProductsSuccess(products));
      },
      emit: emit,
      failureStateBuilder: (message) => CartProductsFailure(message),
    );
  }
}
