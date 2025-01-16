import 'package:delivery_app/core/Extensions/widget.extenstion.dart';
import 'package:delivery_app/features/orders/view/components/custom_order.dart';
import 'package:flutter/material.dart';

import '../../../app/model/order.dart';

class OrdersList extends StatelessWidget {
  const OrdersList({super.key, required this.orders});
  final List<OrderModel> orders;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 1.2,
      child: ListView.builder(
        itemCount: orders.length,
        itemBuilder: (context, index) {
          return CustomOrder(
            order: orders[index],
          ).staggerListHorizontal(index);
        },
      ),
    );
  }
}
