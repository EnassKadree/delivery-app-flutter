import 'package:meta/meta.dart';

import '../../../../core/base/base_cubit.dart';
import '../../../../core/functions/functions.dart';
import '../../../../core/network/api.dart';
import '../../../../core/network/end_point.dart';
import '../../../app/model/store.dart';
import '../../../app/model/user.dart';

part 'stores_state.dart';

class StoresCubit extends BaseCubit<StoresState> {
  StoresCubit() : super(StoresInitial());
  final String endPoint = '${EndPoint.baseUrl}${EndPoint.stores}';
  final String searchEndPoint= '${EndPoint.baseUrl}${EndPoint.homeSearch}';

  Future<void> getStores([String? searchString]) async
  {
    emit(StoresLoading());

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
