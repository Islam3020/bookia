
import 'package:bookia/core/constants/app_fonts.dart';
import 'package:bookia/core/utils/app_colors.dart';
import 'package:bookia/core/utils/text_styles.dart';
import 'package:bookia/features/into/splash.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const BookiaApp());
}

class BookiaApp extends StatelessWidget {
  const BookiaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
    fontFamily: AppFonts.fontFamily,
              scaffoldBackgroundColor: AppColors.backgroundColor,
              appBarTheme: const AppBarTheme(surfaceTintColor: Colors.transparent,
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
                fillColor: AppColors.accentColor,
                filled: true,
                hintStyle: getSmallTextStyle(),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: AppColors.borderColor),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: AppColors.borderColor),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: Colors.red),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: Colors.red),
                ),
              )),
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}
