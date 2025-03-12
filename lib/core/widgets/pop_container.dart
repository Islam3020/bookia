import 'package:bookia/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class PopContainer extends StatelessWidget {
  const PopContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pop();
      },
      child: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: AppColors.borderColor, width: 1)),
          child: const Padding(
            padding: EdgeInsets.only(left: 4.0),
            child: Icon(
              Icons.arrow_back_ios,
              size: 16,
              color: AppColors.darkColor,
            ),
          )),
    );
  }
}
