import 'package:delivery_app/core/components/something_went_wrong.dart';
import 'package:delivery_app/core/functions/functions.dart';
import 'package:delivery_app/features/app/model/order.dart';
import 'package:delivery_app/features/home/service/orders/orders_cubit.dart';
import 'package:delivery_app/features/orders/view/components/orders_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../core/lists/lists.dart';

class OrdersBuilder extends StatelessWidget {
  const OrdersBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OrdersCubit, OrdersState>
    (
      listener: (context, state) 
      {
        if(state is OrdersFailure)
        {Functions().showAlertDialog(context, false, state.message);}
      },
      builder: (context, state) 
      {
        if(state is! OrdersFailure)
        {
          final List<OrderModel> orders = state is OrdersSuccess ? state.orders : Lists().dummyOrders();
          return Skeletonizer
          (
            enabled: state is OrdersLoading, 
            child: OrdersList(orders: orders)
          );
        }
        return SomeThingWentWrongWidget(onPressed: ()
        {
          context.read<OrdersCubit>().getOrders();
        });
      },
    );
  }
}
