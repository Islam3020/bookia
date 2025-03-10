
import 'package:bookia/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class PopContainer extends StatelessWidget {
  const PopContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(onTap: () {
      Navigator.of(context).pop();
    },
      child: Container(
        width: 30,height: 30,
          
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: AppColors.greyColor,width: .25)),
          child: 
               const Icon(Icons.arrow_back_ios,size: 16,)),
    );
  }
}
