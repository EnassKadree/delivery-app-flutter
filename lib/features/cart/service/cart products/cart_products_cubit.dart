import 'package:delivery_app/features/app/model/user.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../../../../core/base/base_cubit.dart';
import '../../../../core/functions/functions.dart';
import '../../../../core/network/api.dart';
import '../../../../core/network/end_point.dart';
import '../../../app/model/cart.dart';

part 'cart_products_state.dart';

class CartProductsCubit extends BaseCubit<CartProductsState> {
  CartProductsCubit() : super(CartProductsInitial());
    final String endPoint = '${EndPoint.baseUrl}${EndPoint.cartProducts}';
    final String searchEndPoint = '${EndPoint.baseUrl}${EndPoint.cartSearch}';

    final searchController = TextEditingController();

  Future<void> getCart([String? searchString]) async
  {
    emit(CartProductsLoading());

    await executeWithCatch
    (
      action: () async 
      {
        UserModel user = await requireUser();
        String url;
        if(searchString != null)
        { url = Functions().handleParams(searchEndPoint, searchString); }
        else
        { url = endPoint; }
        Map<String, dynamic> response = await Api().get(url: url, token: user.token);

        CartModel cart = CartModel.fromJson(response);
        emit(CartProductsSuccess(cart));
      },
      emit: emit,
      failureStateBuilder: (message) => CartProductsFailure(message),
    );
  }
}
