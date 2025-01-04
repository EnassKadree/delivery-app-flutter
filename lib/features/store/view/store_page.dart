import 'package:delivery_app/core/Extensions/space_extension.dart';
import 'package:delivery_app/core/Extensions/widget.extenstion.dart';
import 'package:delivery_app/features/app/model/store.dart';
import 'package:delivery_app/features/store/service/store%20products/store_products_cubit.dart';
import 'package:delivery_app/features/store/view/components/store_products_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../app/data/data_source.dart';
import '../../category/view/components/search_bar.dart';
import 'components/store_card.dart';

class StorePage extends StatelessWidget {
  const StorePage({super.key, required this.store});
  final StoreModel store;

  @override
  Widget build(BuildContext context) 
  {
    final cubit = context.read<StoreProductsCubit>();
    final String locale = DataSource().getLocale() ?? 'ar';
    return Scaffold
    (
      body: ListView
      (
        shrinkWrap: true,
        children: 
        [
          32.spaceH,
          CustomSearchBar
          (
            controller: cubit.searchController,
            onTap: ()
            {
              cubit.getStoreProducts(store.id!, cubit.searchController.text);
            },
          ),
          SizedBox
          (
            height: MediaQuery.of(context).size.height/5,
            child: StoreCard(locale: locale, store: store),
          ),
          StoreProductsBuilder(store: store)
        ],
      ).horizontalPadding,
    );
  }
}

class StorePageWrapper extends StatelessWidget {
  const StorePageWrapper({super.key, required this.store});
  final StoreModel store;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider
    (
      providers: 
      [
        BlocProvider(create: (context) => StoreProductsCubit()..getStoreProducts(store.id!))
      ],
      child: StorePage(store: store)
    );
  }
}