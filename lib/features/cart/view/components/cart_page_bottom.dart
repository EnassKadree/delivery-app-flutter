import 'package:delivery_app/core/Extensions/string_extensions.dart';
import 'package:delivery_app/core/Extensions/widget.extenstion.dart';
import 'package:delivery_app/features/orders/view/components/show_order_confirmation_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../core/components/custom_button.dart';
import '../../../../core/constants/json_constants.dart';
import '../../service/cart products/cart_products_cubit.dart';

class CartPageBottom extends StatelessWidget {
  const CartPageBottom({super.key});

  @override
  Widget build(BuildContext context) {
    int? total;
    return Row(
      children: [
        BlocBuilder<CartProductsCubit, CartProductsState>(
          builder: (context, state) {
            total = state is CartProductsSuccess ? state.cart.totalPrice : 00;
            return Visibility(
              visible: total != null,
              child: Skeletonizer(
                enabled: state is CartProductsLoading,
                child: Text(
                  "${JsonConstants.total.t(context)}: $total ${JsonConstants.sB.t(context)}",
                  style: Theme.of(context).textTheme.bodyLarge,
                ).horizontalPadding,
              ),
            );
          },
        ),
        Expanded(
          child: CustomButton(
            title: JsonConstants.order.t(context),
            onPressed: () {
              showOrderConfirmationDialog(context, total ?? 0);
            },
          ),
        ),
      ],
    ).mainPadding;
  }
}
