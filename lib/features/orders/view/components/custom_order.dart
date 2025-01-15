import 'package:delivery_app/core/Extensions/context_extension.dart';
import 'package:delivery_app/core/Extensions/space_extension.dart';
import 'package:delivery_app/core/Extensions/string_extensions.dart';
import 'package:delivery_app/core/constants/app_colors.dart';
import 'package:delivery_app/core/constants/json_constants.dart';
import 'package:delivery_app/core/constants/styles_constants.dart';
import 'package:delivery_app/features/app/model/order.dart';
import 'package:delivery_app/features/orders/view/components/show_order.dart';

import 'package:flutter/material.dart';

class CustomOrder extends StatelessWidget {
  const CustomOrder({
    super.key,
    required this.order,
  });
  final OrderModel order;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (order.status == "pending") {
          context.push(const ShowOrder());
        }
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
        ),
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        "${JsonConstants.orderNamber.t(context)} : ${order.id}",
                        style: StylesConsts.midTitleText.copyWith(
                            fontSize: 20, color: AppColors.blueColor)),
                    4.spaceH,
                    Row(
                      children: [
                        Text(
                          "${JsonConstants.status.t(context)}: ",
                          style: StylesConsts.midTitleText.copyWith(
                              fontSize: 20, color: AppColors.blueColor),
                        ),
                        getStatusText(order.status ?? " ", context)
                      ],
                    )
                  ],
                ),
              ),
              Text(
                order.totalPrice.toString(),
                style: StylesConsts.greyTextSm,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget getStatusText(String status, BuildContext context) {
  switch (status) {
    case 'pending':
      return Text(JsonConstants.pending.t(context),
          style: StylesConsts.darkTextSm
              .copyWith(color: AppColors.lightYellowColor));
    case 'inProgress':
      return Text(JsonConstants.inProgress.t(context),
          style:
              StylesConsts.darkTextSm.copyWith(color: AppColors.orangeColor));
    case 'completed':
      return Text(JsonConstants.completed.t(context),
          style: StylesConsts.darkTextSm.copyWith(color: AppColors.greenColor));
    default:
      return const Text(
        "غير معروف",
        style: TextStyle(fontSize: 14, color: AppColors.backGroundGreyColor),
      );
  }
}
