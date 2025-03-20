import 'package:bookia/core/constants/assets_manager.dart';
import 'package:bookia/core/extension/extensions.dart';
import 'package:bookia/core/utils/text_styles.dart';
import 'package:bookia/core/widgets/custom_buttons.dart';
import 'package:bookia/features/auth/presentation/pages/login_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class PasswordChanged extends StatelessWidget {
  const PasswordChanged({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(22.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(AssetsManager.successmark),
              const Gap(10),
              Text(
                "Password Changed!",
                style: getTitleTextStyle(context),
              ),
              const Gap(10),
              Text(
                "Your password has been changed successfully.",
                style: getSmallTextStyle(),
              ),
              const Gap(20),
              CustomButton(
                  text: "Back to Login",
                  onPressed: () {
                    context.pushAndRemoveUntil(const LoginView());
                  })
            ],
          ),
        ),
      ),
    );
  }
}
