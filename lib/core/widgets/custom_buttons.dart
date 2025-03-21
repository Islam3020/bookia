import 'package:bookia/core/utils/app_colors.dart';
import 'package:bookia/core/utils/text_styles.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.text,
      required this.onPressed,
      this.width,
      this.hasBorder = false,
      this.bgColor = AppColors.primaryColor,
      this.fgColor = AppColors.backgroundColor,
      this.height});
  final String text;
  final Function() onPressed;
  final double? width;
  final double? height;
  final bool hasBorder;
  final Color bgColor;
  final Color fgColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      height: height ?? 55,
      child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              backgroundColor: bgColor,
              side: hasBorder
                  ? const BorderSide(color: AppColors.darkColor, width: 1)
                  : null),
          child: Text(
            text,
            style: getSmallTextStyle(color: fgColor),
          )),
    );
  }
}
