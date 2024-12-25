
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../core/components/something_went_wrong.dart';
import '../../../../core/functions/functions.dart';
import '../../../../core/lists/lists.dart';
import '../../../app/model/store.dart';
import '../../service/stores/stores_cubit.dart';
import 'stores_list.dart';

class StoresBuilder extends StatelessWidget {
  const StoresBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<StoresCubit, StoresState>
    (
      listener: (context, state) 
      {
        if(state is StoresFailure)
        {Functions().showAlertDialog(context, false, state.message);}
      },
      builder: (context, state) 
      {
        if(state is! StoresFailure)
        {
          final List<StoreModel> stores = state is StoresSuccess ? state.stores : Lists().dummyStores();
          return Skeletonizer
          (
            enabled: state is StoresLoading, 
            child: StoresList(stores: stores)
          );
        }
        return SomeThingWentWrongWidget(onPressed: ()
        {
          context.read<StoresCubit>().getStores();
        });
      },
    );
  }
}
