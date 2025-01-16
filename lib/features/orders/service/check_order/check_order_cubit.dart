import 'package:bloc/bloc.dart';
import 'package:delivery_app/Core/base/base_cubit.dart';
import 'package:delivery_app/Core/network/api.dart';
import 'package:delivery_app/Core/network/end_point.dart';
import 'package:delivery_app/features/app/model/user.dart';
import 'package:meta/meta.dart';

part 'check_order_state.dart';

class CheckOrderCubit extends BaseCubit<CheckOrderState> {
  CheckOrderCubit() : super(CheckOrderInitial());
  final String endPoint = '${EndPoint.baseUrl}${EndPoint.orders}';

  Future<void> getSuccess() async {
    emit(CheckOrderLoading());

    await executeWithCatch(
      action: () async {
        UserModel user = await requireUser();

        Map<String, dynamic> response =
            await Api().get(url: endPoint, token: user.token);

        emit(CheckOrderSuccess(response));
      },
      emit: emit,
      failureStateBuilder: (message) => CheckOrderFailure(message),
    );
  }
}
