import 'package:delivery_app/core/base/base_cubit.dart';
import 'package:delivery_app/features/app/model/product.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../../../../core/functions/functions.dart';
import '../../../../core/network/api.dart';
import '../../../../core/network/end_point.dart';
import '../../../app/model/user.dart';

part 'category_products_state.dart';

class CategoryProductsCubit extends BaseCubit<CategoryProductsState> {
  CategoryProductsCubit() : super(CategoryProductsInitial());
    final String endPoint = '${EndPoint.baseUrl}${EndPoint.categories}';
    final String searchEndPoint= '${EndPoint.baseUrl}${EndPoint.categorySearch}';

    final searchController = TextEditingController();

  Future<void> getCategoryProducts(int categoryId, [String? searchString]) async
  {
    emit(CategoryProductsLoading());

    await executeWithCatch
    (
      action: () async 
      {
        UserModel user = await requireUser();
        String url;
        if(searchString != null)
        { url = Functions().handleParams('$searchEndPoint/$categoryId', searchString); }
        else
        { url = '$endPoint/$categoryId'; }
        Map<String, dynamic> response = await Api().get(url: url, token: user.token);

        List<ProductModel> products = parseResponse<ProductModel>
        (
          response: response,
          fromJson: (data) => ProductModel.fromJson(data),
          dataName: 'products'
        );
        emit(CategoryProductsSuccess(products));
      },
      emit: emit,
      failureStateBuilder: (message) => CategoryProductsFailure(message),
    );
  }
}
