import 'package:delivery_app/features/cart/view/cart_page.dart';
import 'package:delivery_app/features/favourite/view/favourite_page.dart';
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
    HomePageWrapper(),
    MyOrdersPage(),
    FavoritePageWrapper(),
    CartPageWrapper()
  ];
  @override
  Widget build(BuildContext context) 
  {
    List<double> heights = 
    [
      MediaQuery.of(context).size.height / 2.5,
      MediaQuery.of(context).size.height / 4,
      MediaQuery.of(context).size.height / 4,
      MediaQuery.of(context).size.height / 2.5,
    ];
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
                  height:heights[state])
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
    ], child: const HomeLayout());
  }
}
