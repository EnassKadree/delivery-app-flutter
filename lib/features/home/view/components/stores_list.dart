import 'package:delivery_app/core/Extensions/widget.extenstion.dart';
import 'package:flutter/material.dart';

import '../../../app/model/store.dart';
import 'store_container.dart';

class StoresList extends StatelessWidget {
  const StoresList({
    super.key, required this.stores,
  });
  final List<StoreModel> stores;

  @override
  Widget build(BuildContext context) 
  {
    return SizedBox
    (
      height: MediaQuery.of(context).size.height/5.5,
      child: ListView.builder
      (
        itemCount: stores.length,
        padding: const EdgeInsets.symmetric(vertical: 16),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index)
        {
          return StoreContainer(store: stores[index]).staggerListHorizontal(index);
        },
      ),
    );
  }
}
