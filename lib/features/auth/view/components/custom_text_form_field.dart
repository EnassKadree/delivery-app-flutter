
import 'package:flutter/material.dart';

import '../../../../Core/constants/app_colors.dart';
import '../../../../Core/functions/functions.dart';

class CustomTextFromField extends StatelessWidget {
  const CustomTextFromField({
    super.key, required this.label, required this.controller, required this.type,this.readOnly=false,
  });
  final String label;
  final TextEditingController controller;
  final TextInputType type;
   final bool readOnly;
  @override
  Widget build(BuildContext context) {
    return TextFormField
    (readOnly: readOnly,
      controller: controller,
      style: const TextStyle(color: AppColors.blueColor),
      obscureText: type == TextInputType.visiblePassword,
      keyboardType: type,
      decoration: InputDecoration(hintText: label),
      validator: (value)
      {
        if(type == TextInputType.phone)
        {return Functions().phoneValidator(value, context);}
        if(type == TextInputType.visiblePassword)
        {return Functions().passwordValidator(value, context);}
        if(type == TextInputType.text)
        {return Functions().usernameValidator(value, context);}
        return Functions().nameValidator(value, context);
      },
    );
  }
}