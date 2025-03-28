import 'package:bookia/core/constants/app_fonts.dart';
import 'package:bookia/core/services/dio_provider.dart';
import 'package:bookia/core/services/local_helper.dart';
import 'package:bookia/core/utils/app_colors.dart';
import 'package:bookia/core/utils/text_styles.dart';
import 'package:bookia/features/auth/presentation/bloc/cubit/auth_cubit.dart';
import 'package:bookia/features/into/splash.dart';
import 'package:bookia/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:bookia/features/search/presentation/cubit/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DioProvider.init();
  await LocalHelper.init();
  runApp(const BookiaApp());
}

class BookiaApp extends StatelessWidget {
  const BookiaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthCubit(),
        ),
        BlocProvider(
          create: (context) => SearchCubit(),
        ),
        BlocProvider(create: (context) => ProfileCubit()..getProfile())
      ],
      child: MaterialApp(
        theme: ThemeData(
            fontFamily: AppFonts.fontFamily,
            scaffoldBackgroundColor: AppColors.backgroundColor,
            appBarTheme: AppBarTheme(
              surfaceTintColor: Colors.transparent,
              backgroundColor: AppColors.backgroundColor,
              elevation: 0,
              titleTextStyle: TextStyle(
                  color: AppColors.darkColor,
                  fontSize: 24,
                  fontFamily: AppFonts.fontFamily,
                  fontWeight: FontWeight.bold),
              iconTheme: const IconThemeData(color: AppColors.primaryColor),
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
      ),
    );
  }
}
