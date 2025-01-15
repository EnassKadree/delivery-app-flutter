import 'package:delivery_app/core/Extensions/string_extensions.dart';
import 'package:delivery_app/core/Extensions/widget.extenstion.dart';
import 'package:delivery_app/core/constants/json_constants.dart';
import 'package:delivery_app/core/constants/styles_constants.dart';
import 'package:delivery_app/core/functions/functions.dart';
import 'package:delivery_app/features/home/service/orders/orders_cubit.dart';
import 'package:delivery_app/features/orders/view/components/orders_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyOrdersPage extends StatelessWidget {
  const MyOrdersPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
        physics: const BouncingScrollPhysics(),
        children: Functions().staggeredList([
          Text(
            JsonConstants.orders.t(context),
            style: StylesConsts.darkTextLg,
          ).horizontalPadding,
          const OrdersBuilder(),
        ]));
  }
}

class OrderPageWrapper extends StatelessWidget {
  const OrderPageWrapper({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(create: (context) => OrdersCubit()..getOrders()),
    ], child: const MyOrdersPage());
  }
}
