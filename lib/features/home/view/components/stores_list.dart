import 'package:flutter/material.dart';

import 'store_container.dart';

class StoresList extends StatelessWidget {
  const StoresList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox
    (
      height: MediaQuery.of(context).size.height/5.5,
      child: ListView.builder
      (
        padding: const EdgeInsets.symmetric(vertical: 16),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index)
        {
          return const StoreContainer();
        },
      ),
    );
  }
}
