import 'package:delivery_app/Core/base/base_cubit.dart';
import 'package:meta/meta.dart';

import '../../../../Core/network/api.dart';
import '../../../../Core/network/end_point.dart';
import '../../../app/model/user.dart';

part 'favorite_state.dart';

class FavoriteCubit extends BaseCubit<FavoriteState> {
  FavoriteCubit() : super(FavoriteInitial());
    final String endPoint1 = '${EndPoint.baseUrl}${EndPoint.addToFavorite}';
    final String endPoint2 = '${EndPoint.baseUrl}${EndPoint.removeFromFavorite}';

  Future<void> addToFavorite(int productId) async
  {
    emit(FavoriteLoading());

    await executeWithCatch
    (
      action: () async 
      {
        UserModel user = await requireUser();
        // ignore: missing_required_param
        Map<String, dynamic> response = await Api().post(url: '$endPoint1/$productId', token: user.token);
        emit(FavoriteSuccess(response['message']));
      },
      emit: emit,
      failureStateBuilder: (message) => FavoriteFailure(message),
    );
  }
  Future<void> removeFromFavorite (int productId) async
  {
    emit(FavoriteLoading());

    await executeWithCatch
    (
      action: () async 
      {
        UserModel user = await requireUser();
        // ignore: missing_required_param
        Map<String, dynamic> response = await Api().delete(url: '$endPoint2/$productId', token: user.token);
        emit(FavoriteSuccess(response['message']));
      },
      emit: emit,
      failureStateBuilder: (message) => FavoriteFailure(message),
    );
  }
}
