import 'package:meta/meta.dart';

import '../../../../core/base/base_cubit.dart';
import '../../../../core/network/api.dart';
import '../../../../core/network/end_point.dart';
import '../../../app/model/product.dart';

part 'products_state.dart';

class ProductsCubit extends BaseCubit<ProductsState> {
  ProductsCubit() : super(ProductsInitial());
    final String endPoint = '${EndPoint.baseUrl}${EndPoint.products}';

  Future<void> getProducts() async
  {
    emit(ProductsLoading());

    await executeWithCatch
    (
      action: () async 
      {
        Map<String, dynamic> response = await Api().getWithoutToken(url: endPoint);

        List<ProductModel> products = parseResponse<ProductModel>
        (
          response: response,
          fromJson: (data) => ProductModel.fromJson(data),
          dataName: 'products'
        );
        emit(ProductsSuccess(products));
      },
      emit: emit,
      failureStateBuilder: (message) => ProductsFailure(message),
    );
  }
}
