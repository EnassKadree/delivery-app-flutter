import 'package:delivery_app/core/Extensions/context_extension.dart';
import 'package:delivery_app/core/Extensions/space_extension.dart';
import 'package:delivery_app/core/Extensions/string_extensions.dart';
import 'package:delivery_app/core/constants/app_colors.dart';
import 'package:delivery_app/core/constants/json_constants.dart';
import 'package:delivery_app/core/constants/styles_constants.dart';
import 'package:delivery_app/core/functions/functions.dart';
import 'package:delivery_app/features/orders/view/components/request_order.dart';

import 'package:flutter/material.dart';

class CustomOrder extends StatelessWidget {
  const CustomOrder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(const RequestOrder());
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
                    Text("Order Number : 12463222",
                        style: StylesConsts.midTitleText.copyWith(
                            fontSize: 20, color: AppColors.blueColor)),
                    4.spaceH,
                    Row(
                      children: [
                        Text(
                          "State: ",
                          style: StylesConsts.midTitleText.copyWith(
                              fontSize: 20, color: AppColors.blueColor),
                        ),
                        getStatusText("completed", context)
                      ],
                    )
                  ],
                ),
              ),
              Text(
                "2/2/2025",
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
