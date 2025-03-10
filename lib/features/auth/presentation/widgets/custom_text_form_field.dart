import 'package:bookia/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.validator,  this.hintText,
  });
  final String? hintText;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(cursorColor: AppColors.primaryColor,
      decoration: InputDecoration(
          filled: true,
          fillColor: AppColors.borderColor,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
             borderRadius: BorderRadius.circular(10),
             borderSide: const BorderSide(color: AppColors.primaryColor)
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
             borderSide: const BorderSide(color: AppColors.primaryColor)
          ),
          hintText: hintText,
          hintStyle:  const TextStyle(color: AppColors.greyColor)),
      validator: validator,
    );
  }
}
