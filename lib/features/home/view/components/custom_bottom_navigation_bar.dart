
import 'package:delivery_app/core/Extensions/context_extension.dart';
import 'package:delivery_app/core/Extensions/string_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../core/constants/json_constants.dart';
import '../../service/navigationbar/bottom_nav_cubit.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container
    (
      margin: const EdgeInsets.only(bottom: 24, right: 24, left: 24),
      child: BlocBuilder<BottomNavCubit, int>
      (
        builder: (context, state) 
        {
          return ClipRRect
          (
            borderRadius: BorderRadius.circular(16),
            child: BottomNavigationBar
            (
              backgroundColor: context.colorScheme.surfaceContainer,
              currentIndex: state,
              onTap: (index) => context.read<BottomNavCubit>().updateTab(index),
              items: 
              [ 
                BottomNavigationBarItem(icon: const Icon(Iconsax.home), label: JsonConstants.home.t(context)),
                BottomNavigationBarItem(icon: const Icon(Iconsax.document), label: JsonConstants.orders.t(context)),
                BottomNavigationBarItem(icon: const Icon(Iconsax.heart), label: JsonConstants.favorite.t(context)),
                BottomNavigationBarItem(icon: const Icon(Iconsax.bag_2), label: JsonConstants.cart.t(context)),
              ]
            ),
          );
      }),
    );
  }
}