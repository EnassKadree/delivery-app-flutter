import 'package:meta/meta.dart';

import '../../../../core/base/base_cubit.dart';
import '../../../../core/network/api.dart';
import '../../../../core/network/end_point.dart';
import '../../../app/model/store.dart';

part 'stores_state.dart';

class StoresCubit extends BaseCubit<StoresState> {
  StoresCubit() : super(StoresInitial());
  final String endPoint = '${EndPoint.baseUrl}${EndPoint.stores}';

  Future<void> getStores() async
  {
    emit(StoresLoading());

    await executeWithCatch
    (
      action: () async 
      {
        Map<String, dynamic> response = await Api().getWithoutToken(url: endPoint);

        List<StoreModel> stores = parseResponse<StoreModel>
        (
          response: response,
          fromJson: (data) => StoreModel.fromJson(data),
          dataName: 'stores'
        );
        emit(StoresSuccess(stores));
      },
      emit: emit,
      failureStateBuilder: (message) => StoresFailure(message),
    );
  }
}
