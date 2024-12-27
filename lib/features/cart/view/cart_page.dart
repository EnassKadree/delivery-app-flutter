import 'package:delivery_app/core/Extensions/space_extension.dart';
import 'package:delivery_app/core/Extensions/string_extensions.dart';
import 'package:delivery_app/core/Extensions/widget.extenstion.dart';
import 'package:delivery_app/core/constants/styles_constants.dart';
import 'package:delivery_app/features/cart/view/components/cart_page_bottom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/constants/json_constants.dart';
import '../service/cart products/cart_products_cubit.dart';
import 'components/cart_products_builder.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      bottomNavigationBar: const CartPageBottom(),
      body: ListView
      (
        //padding: const EdgeInsets.only(top: 32),
        children: 
        [
          Text(JsonConstants.cart.t(context), style: StylesConsts.darkTextLg),
          16.spaceH,
          const CartProductsBuilder()
        ],
      ).horizontalPadding,
    );
  }
}

class CartPageWrapper extends StatelessWidget {
  const CartPageWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(create: (context) => CartProductsCubit()..getCart()),
    ], child: const CartPage());
  }
}
