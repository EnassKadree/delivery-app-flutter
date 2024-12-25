import 'package:delivery_app/features/cart/view/cart_page.dart';
import 'package:delivery_app/features/favourite/view/favourite_page.dart';
import 'package:delivery_app/features/home/service/cubit/categories_cubit.dart';
import 'package:delivery_app/features/orders/view/my_orders_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../service/navigationbar/bottom_nav_cubit.dart';
import 'components/background_container.dart';
import 'components/custom_bottom_navigation_bar.dart';
import 'components/home_app_bar.dart';
import 'home_page.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({super.key});
  static const _pages = [
    HomePage(),
    MyOrdersPage(),
    FavouritePage(),
    CartPage()
  ];
  @override
  Widget build(BuildContext context) 
  {
    return Scaffold
    (
      extendBodyBehindAppBar: true,
      appBar: const HomeAppBar(),
      bottomNavigationBar: const CustomBottomNavigationBar(),
      body: BlocBuilder<BottomNavCubit, int>(
        builder: (context, state) {
          return Stack(children: [
            Positioned.fill(
              child: BackgroundContainer(
                  height: MediaQuery.of(context).size.height / 2.5),
            ),
            _pages[state],
          ]);
        },
      ),
    );
  }
}

class HomeLayoutWrapper extends StatelessWidget {
  const HomeLayoutWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(create: (context) => BottomNavCubit()),
      BlocProvider(create: (context) => CategoriesCubit()..getCategories()),
    ], child: const HomeLayout());
  }
}
