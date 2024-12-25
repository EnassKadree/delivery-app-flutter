
import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

class SomeThingWentWrongWidget extends StatelessWidget {
  const SomeThingWentWrongWidget({
    super.key,
    required this.onPressed,
  });

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row
    (
      mainAxisAlignment: MainAxisAlignment.center,
      children: 
      [
        Text('حدث خطأ ما!', 
        style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: AppColors.blueColor),
        ),
        TextButton
        (
          onPressed: onPressed,
          style: TextButton.styleFrom
          (
            backgroundColor: Colors.transparent,
          ),
          child: Text('إعادة المحاولة',
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: Colors.blue),),
        ),
      ],
    );
  }
}
