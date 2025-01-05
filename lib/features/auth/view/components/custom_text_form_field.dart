import 'package:flutter/material.dart';
import '../../../../Core/constants/app_colors.dart';
import '../../../../Core/functions/functions.dart';

class CustomTextFromField extends StatelessWidget {
  const CustomTextFromField({
    super.key,
    required this.label,
    required this.controller,
    required this.type,
    this.readOnly = false, this.onChanged,
  });
  final String label;
  final TextEditingController controller;
  final TextInputType type;
  final bool readOnly;
  final void Function()? onChanged;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: readOnly,
      controller: controller,
      style: const TextStyle(color: AppColors.blueColor),
      obscureText: type == TextInputType.visiblePassword,
      keyboardType: type,
      decoration: InputDecoration(hintText: label),
      onChanged: (value)
      {
        if(onChanged != null)
        {onChanged!();}
      },
      validator: (value) {
        if (type == TextInputType.phone) {
          return Functions().phoneValidator(value, context);
        }
        if (type == TextInputType.emailAddress) {
          return Functions().emailValidator(value, context);
        }

        if (type == TextInputType.visiblePassword) {
          return Functions().passwordValidator(value, context);
        }
        return Functions().nameValidator(value, context);
      },
    );
  }
}
