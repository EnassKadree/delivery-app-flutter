import 'package:delivery_app/Core/constants/styles_constants.dart';
import 'package:delivery_app/core/Extensions/space_extension.dart';
import 'package:delivery_app/core/Extensions/string_extensions.dart';
import 'package:delivery_app/core/components/modal_progress_hud_nsn.dart';
import 'package:delivery_app/core/constants/json_constants.dart';
import 'package:delivery_app/core/functions/functions.dart';
import 'package:delivery_app/features/orders/service/check_order/check_order_cubit.dart';
import 'package:delivery_app/features/orders/service/post_order/order_post_cubit.dart';
import 'package:delivery_app/features/profile/service/get_info/profile_cubit.dart';
import 'package:delivery_app/features/profile/service/updaute/update_profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void showOrderConfirmationDialog(BuildContext context, int price) {
  final TextEditingController addressController = TextEditingController();

  showDialog(
    context: context,
    builder: (BuildContext context) {
      final updateProfileCubit = BlocProvider.of<UpdateProfileCubit>(context);
      final checkOrderCubit = BlocProvider.of<CheckOrderCubit>(context);
      return MultiBlocListener(
        listeners: [
          BlocListener<ProfileCubit, ProfileState>(
            listener: (context, state) {
              if (state is ProfileSuccess) {
                addressController.text = state.customer.address ?? '';
              }
            },
          ),
          BlocListener<OrderPostCubit, OrderPostState>(
            listener: (context, state) {
              if (state is OrderPostSuccess) {
                Functions().showSnackBar(context, "Order placed successfully!");
              }
              if (state is OrderPostFailure) {
                Functions().showAlertDialog(context, false, state.message);
              }
            },
          ),
          BlocListener<CheckOrderCubit, CheckOrderState>(
            listener: (context, state) {
              if (state is CheckOrderFailure) {
                Functions().showAlertDialog(context, false, state.message);
              }
              if (state is CheckOrderSuccess) {
                final updatedAddress = addressController.text;

                context.read<OrderPostCubit>().postOrder(
                      address: updatedAddress,
                    );
                Navigator.of(context).pop();
              }
            },
          ),
        ],
        child: BlocBuilder<OrderPostCubit, OrderPostState>(
          builder: (context, state) {
            return CustomProgressIndicator(
                inAsyncCall: state is OrderPostLoading,
                child: OrderAlertDialog(
                  addressController: addressController,
                  updateProfileCubit: updateProfileCubit,
                  price: price,
                  checkOrderCubit: checkOrderCubit,
                ));
          },
        ),
      );
    },
  );
}

class OrderAlertDialog extends StatelessWidget {
  const OrderAlertDialog({
    super.key,
    required this.addressController,
    required this.updateProfileCubit,
    required this.price,
    required this.checkOrderCubit,
  });
  final CheckOrderCubit checkOrderCubit;
  final TextEditingController addressController;
  final UpdateProfileCubit updateProfileCubit;
  final int price;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        JsonConstants.confirmOrder.t(context),
        style: StylesConsts.midTitleText,
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            '${JsonConstants.total.t(context)} $price ${JsonConstants.syp.t(context)}',
          ),
          20.spaceH,
          TextField(
            controller: addressController,
            decoration: InputDecoration(
              labelText: JsonConstants.address.t(context),
              border: const OutlineInputBorder(),
            ),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(JsonConstants.cancel.t(context)),
        ),
        ElevatedButton(
          onPressed: () {
            checkOrderCubit.getSuccess();
          },
          child: Text(JsonConstants.confirmation.t(context)),
        ),
      ],
    );
  }
}
