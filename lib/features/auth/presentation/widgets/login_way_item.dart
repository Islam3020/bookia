
import 'package:bookia/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class LoginWayItem extends StatelessWidget {
  const LoginWayItem({
    super.key,
    required this.widget,
  });
  final Widget? widget;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
          
          height: 56,
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              border: Border.all(color: AppColors.borderColor),
              borderRadius: BorderRadius.circular(8)),
          child: widget),
    );
  }
}
