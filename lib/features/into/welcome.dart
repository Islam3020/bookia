import 'package:bookia/core/constants/assets_manager.dart';
import 'package:bookia/core/extension/extensions.dart';
import 'package:bookia/core/utils/app_colors.dart';

import 'package:bookia/core/utils/text_styles.dart';
import 'package:bookia/core/widgets/custom_buttons.dart';
import 'package:bookia/features/auth/presentation/pages/login_view.dart';
import 'package:bookia/features/auth/presentation/pages/register_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(AssetsManager.bgimage),
                fit: BoxFit.cover)),
        child: Padding(
          padding: const EdgeInsets.only(left: 22.0,right: 22,top: 135,bottom: 100),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(AssetsManager.logo,width: 200,),
            const Gap(10),
            Text("Order your Book Now!",
             style: getBodyTextStyle(context),),
              const   Spacer(),
              CustomButton(
                text: 'Login',
                onPressed: () {
                  context.pushTo(const LoginView());
                },
              ),
              const SizedBox(height: 20,),
              CustomButton(hasBorder: true,
                fgColor: AppColors.darkColor,
                bgColor: AppColors.backgroundColor,
                text: 'Register',
                onPressed: () {
                  context.pushTo(const RegisterView());
                },
              ),
              
              ],
          ),
        ),
      ),
    
    );
  }
}