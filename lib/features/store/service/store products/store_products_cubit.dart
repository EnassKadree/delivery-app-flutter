import 'package:delivery_app/core/base/base_cubit.dart';
import 'package:delivery_app/features/app/model/product.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../../../../core/functions/functions.dart';
import '../../../../core/network/api.dart';
import '../../../../core/network/end_point.dart';
import '../../../app/model/user.dart';

part 'store_products_state.dart';

class StoreProductsCubit extends BaseCubit<StoreProductsState> {
  StoreProductsCubit() : super(StoreProductsInitial());
    final String endPoint = '${EndPoint.baseUrl}${EndPoint.stores}';
    final String searchEndPoint = '${EndPoint.baseUrl}${EndPoint.storeSearch}';

    final searchController = TextEditingController();

  Future<void> getStoreProducts(int storeId, [String? searchString]) async
  {
    emit(StoreProductsLoading());

    await executeWithCatch
    (
      action: () async 
      {
        UserModel user = await requireUser();
        String url;
        if(searchString != null)
        { url = Functions().handleParams('$searchEndPoint/$storeId', searchString); }
        else
        { url = '$endPoint/$storeId'; }
        Map<String, dynamic> response = await Api().get(url: url, token: user.token);

        List<ProductModel> products = parseResponse<ProductModel>
        (
          response: response,
          fromJson: (data) => ProductModel.fromJson(data),
          dataName: 'products'
        );
        emit(StoreProductsSuccess(products));
      },
      emit: emit,
      failureStateBuilder: (message) => StoreProductsFailure(message),
    );
  }
}
