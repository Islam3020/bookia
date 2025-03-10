
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
    return Container(
        width: 105,
        height: 56,
        decoration: BoxDecoration(
            border: Border.all(color: AppColors.borderColor),
            borderRadius: BorderRadius.circular(16)),
        child: widget);
  }
}
