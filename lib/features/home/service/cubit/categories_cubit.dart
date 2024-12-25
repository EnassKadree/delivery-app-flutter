import 'package:delivery_app/core/base/base_cubit.dart';
import 'package:delivery_app/features/app/model/category.dart';
import 'package:meta/meta.dart';

import '../../../../core/network/api.dart';
import '../../../../core/network/end_point.dart';

part 'categories_state.dart';

class CategoriesCubit extends BaseCubit<CategoriesState> 
{
  CategoriesCubit() : super(CategoriesInitial());
  final String endPoint = '${EndPoint.baseUrl}${EndPoint.categories}';

  Future<void> getCategories() async
  {
    emit(CategoriesLoading());

    await executeWithCatch
    (
      action: () async 
      {
        Map<String, dynamic> response = await Api().getWithoutToken(url: endPoint);

        List<CategoryModel> categories = parseResponse<CategoryModel>
        (
          response: response,
          fromJson: (data) => CategoryModel.fromJson(data),
          dataName: 'categories'
        );
        emit(CategoriesSuccess(categories));
      },
      emit: emit,
      failureStateBuilder: (message) => CategoriesFailure(message),
    );
  }
}
