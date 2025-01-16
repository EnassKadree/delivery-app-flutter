import 'package:delivery_app/core/Extensions/context_extension.dart';
import 'package:delivery_app/core/Extensions/space_extension.dart';
import 'package:delivery_app/core/Extensions/string_extensions.dart';
import 'package:delivery_app/core/Extensions/widget.extenstion.dart';
import 'package:delivery_app/core/components/custom_button.dart';
import 'package:delivery_app/core/components/something_went_wrong.dart';
import 'package:delivery_app/core/functions/functions.dart';
import 'package:delivery_app/features/app/model/order_details.dart';
import 'package:delivery_app/features/orders/service/order/order_cubit.dart';
import 'package:delivery_app/features/orders/service/order_details/order_details_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/json_constants.dart';
import '../../../core/constants/styles_constants.dart';
import '../../home/view/home_layout.dart';
import 'components/custom_order.dart';
import 'components/order_products_list.dart';

class ShowOrderPage extends StatelessWidget {
  const ShowOrderPage({super.key, required this.orderId});
  final int orderId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding
      (
        padding: const EdgeInsets.all(16),
        child: Row
        (
          children: 
          [
            IconButton
            (
              onPressed: () async
              {
                context.read<OrderCubit>().deleteOrder(orderId);
                Future.delayed(const Duration(seconds: 2), ()
                {
                  context.pushAndRemoveAll(const HomeLayoutWrapper());
                });
              }, 
              icon: const Icon(Iconsax.trash, size: 32,),
              color: AppColors.yellowColor,
            ),
            Expanded
            (
              child: CustomButton
              (
                title: JsonConstants.upDate.t(context),
                onPressed: ()
                {
                  Future.delayed(const Duration(seconds: 2), ()
                  {
                    context.pop();
                    Functions().showAlertDialog(context, true, 'updated successfully');
                  });
                },
              ),
            ),
          ],
        )
      ),
        appBar: AppBar(),
        body: BlocBuilder<OrderDetailsCubit, OrderDetailsState>
        (
          builder: (context, state) 
          {
            if(state is OrderDetailsSuccess)
            {
              OrderDetailsModel order = state.order;
              return ListView(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                children: 
                [
                  Row(
                    children: 
                    [
                      Text
                      (
                        "${JsonConstants.status.t(context)}: ",
                        style: StylesConsts.midTitleText
                            .copyWith(fontSize: 20, color: AppColors.blueColor),
                      ),
                      getStatusText
                      (
                          order.orderDetailes!.orderStatus ?? " ", context
                      )
                    ],
                  ),
                  8.spaceH,
                  Row(
                    children: 
                    [
                      Text
                      (
                        "${JsonConstants.total.t(context)}: ",
                        style: StylesConsts.midTitleText
                            .copyWith(fontSize: 20, color: AppColors.blueColor),
                      ),
                      Text(order.orderDetailes!.totalPrice.toString(),
                      style: StylesConsts.midTitleText,)
                    ],
                  ),
                  16.spaceH,
                  OrderProductList(products: order.products!)
                ],
              );
            }
            if(state is OrderDetailsLoading)
            {
              return const SizedBox();
            }
            return SomeThingWentWrongWidget(onPressed: (){context.read<OrderDetailsCubit>().getOrders(orderId);});
          },
        ).mainPadding
      );
  }
}

class ShowOrderPageWrapper extends StatelessWidget {
  const ShowOrderPageWrapper({super.key, required this.orderId});
  final int orderId;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(create: (context) => OrderDetailsCubit()..getOrders(orderId)),
      BlocProvider(create: (context) => OrderCubit()),
    ], child: ShowOrderPage(orderId: orderId,));
  }
}
