import 'package:bookia/core/utils/app_colors.dart';
import 'package:bookia/core/utils/text_styles.dart';
import 'package:flutter/material.dart';

class AppThemes {
  static ThemeData lightTheme =  ThemeData(
              scaffoldBackgroundColor: AppColors.backgroundColor,
              appBarTheme: const AppBarTheme(
                backgroundColor: AppColors.backgroundColor,
                elevation: 0,
                titleTextStyle: TextStyle(
                  color: AppColors.darkColor,
                  fontSize: 18,
                
                ),
                iconTheme: IconThemeData(color: AppColors.primaryColor),
              ),
              colorScheme: ColorScheme.fromSeed(
                seedColor: AppColors.primaryColor,
                onSurface: AppColors.darkColor,
              ),
              inputDecorationTheme: InputDecorationTheme(
                hintStyle: getSmallTextStyle(),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(color: AppColors.primaryColor),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(color: AppColors.primaryColor),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(color: Colors.red),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(color: Colors.red),
                ),
              ));

              static ThemeData darkTheme =  ThemeData(
              scaffoldBackgroundColor: AppColors.darkColor,
              appBarTheme: const AppBarTheme(
                backgroundColor: AppColors.darkColor,
                elevation: 0,
                titleTextStyle:TextStyle(
                  color: AppColors.backgroundColor,
                  fontSize: 18,
                  
                ),
                iconTheme: IconThemeData(color: AppColors.primaryColor),
              ),
              colorScheme: ColorScheme.fromSeed(
                seedColor: AppColors.primaryColor,
                onSurface: AppColors.backgroundColor,
              ),
              inputDecorationTheme: InputDecorationTheme(
                hintStyle: getSmallTextStyle(),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(color: AppColors.primaryColor),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(color: AppColors.primaryColor),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(color: Colors.red),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(color: Colors.red),
                ),
              ));
          
         
}