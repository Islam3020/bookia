import 'package:bookia/core/constants/app_fonts.dart';
import 'package:bookia/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

TextStyle getHeadLineTextStyle(
  BuildContext context, {
  double? fontSize,
  Color? color,
}) {
  return TextStyle(
    fontFamily: AppFonts.fontFamily,
    fontSize: fontSize ?? 30,
    color: color ?? Theme.of(context).colorScheme.onSurface,
  );
}

TextStyle getTitleTextStyle(
  BuildContext context, {
  double? fontSize,
  Color? color,
}) {
  return TextStyle(
    fontFamily: AppFonts.fontFamily,
    fontSize: fontSize ?? 24,
    color: color ?? Theme.of(context).colorScheme.onSurface,
  );
}

TextStyle getBodyTextStyle(
  BuildContext context, {
  double? fontSize,
  Color? color,
}) {
  return TextStyle(
    fontFamily: AppFonts.fontFamily,
    fontSize: fontSize ?? 18,
    color: color ?? Theme.of(context).colorScheme.onSurface,
  );
}

TextStyle getSmallTextStyle({
  double? fontSize,
  Color? color,
}) {
  return TextStyle(
    fontFamily: AppFonts.fontFamily,
    fontSize: fontSize ?? 14,
    color: color ?? AppColors.greyColor,
  );
}
