import 'package:delivery_app/Core/base/base_cubit.dart';
import 'package:delivery_app/features/app/model/product.dart';
import 'package:meta/meta.dart';

import '../../../../Core/network/api.dart';
import '../../../../Core/network/end_point.dart';
import '../../../app/model/user.dart';

part 'favorite_products_state.dart';

class FavoriteProductsCubit extends BaseCubit<FavoriteProductsState> {
  FavoriteProductsCubit() : super(FavoriteProductsInitial());
    final String endPoint = '${EndPoint.baseUrl}${EndPoint.favoriteProducts}';

  Future<void> getFavoriteProducts() async
  {
    emit(FavoriteProductsLoading());

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
          dataName: 'favorites'
        );
        emit(FavoriteProductsSuccess(products));
      },
      emit: emit,
      failureStateBuilder: (message) => FavoriteProductsFailure(message),
    );
  }
}
