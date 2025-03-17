import 'package:bookia/core/constants/assets_manager.dart';
import 'package:bookia/core/extension/extensions.dart';
import 'package:bookia/core/services/local_helper.dart';
import 'package:bookia/core/utils/text_styles.dart';
import 'package:bookia/main_view.dart';
import 'package:bookia/features/into/welcome.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    String? token = LocalHelper.getCachedData(LocalHelper.tokenkey);
    Future.delayed(const Duration(seconds: 3), () {
      if (token != null) {
        context.pushReplacement(const MainView());
      } else {
        context.pushReplacement(const Welcome());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              AssetsManager.logo,
              width: 200,
            ),
            const Gap(10),
            Text(
              "Order your Book Now!",
              style: getBodyTextStyle(context),
            )
          ],
        ),
      ),
    );
  }
}
