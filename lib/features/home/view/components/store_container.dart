
import 'package:delivery_app/core/Extensions/context_extension.dart';
import 'package:delivery_app/core/Extensions/widget.extenstion.dart';
import 'package:flutter/material.dart';

import '../../../../Core/constants/shadows_constatns.dart';
import '../../../../core/constants/app_assets.dart';
import '../../../../core/network/end_point.dart';
import '../../../app/model/store.dart';
import '../../../store/view/store_page.dart';

class StoreContainer extends StatelessWidget {
  const StoreContainer({
    super.key, required this.store,
  });
  final StoreModel store;

  @override
  Widget build(BuildContext context) {
    return InkWell
    (
      onTap: ()
      {
        context.push(StorePageWrapper(store: store));
      },
      child: Container
      (
        width: MediaQuery.of(context).size.width/4,
        margin: const EdgeInsets.symmetric(horizontal: 8),
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration
        (
          color: context.colorScheme.surfaceContainer,
          borderRadius: BorderRadius.circular(12),
          boxShadow: ShadowsConsts.lg
        ),
        child: Column
        (
          children: 
          [
            Container
            (
              decoration: BoxDecoration
              (
                borderRadius: BorderRadius.circular(12),
              ),
              child: Image.network(
                store.image != null && store.image!.isNotEmpty
                    ? '${EndPoint.storageBaseUrl}${store.image}'
                    : '',
                errorBuilder: (context, error, stackTrace) {
                  return Image.asset(AppAssets.logo1String);
                },
                width: 50,
                height: 50,
              )
            ).mainPadding,
            Text(store.name ?? '')
          ],
        ),
      ),
    );
  }
}