import 'package:bookia/core/constants/assets_manager.dart';
import 'package:bookia/core/utils/text_styles.dart';
import 'package:bookia/core/widgets/custom_buttons.dart';
import 'package:bookia/core/widgets/pop_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class UpdatePassword extends StatelessWidget {
  const UpdatePassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const PopContainer(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(22.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Gap(15),
            Text(
              "New Password",
              style: getHeadLineTextStyle(context),
            ),
            const Spacer(flex: 1,),
            TextFormField(
              decoration: InputDecoration(hintText: 'Current password'),
            ),
            const Gap(30),
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Confirm password',
              ),
            ),
            const Gap(30),
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Confirm password',
                suffixIcon: IconButton(onPressed: (){},
                  icon: SvgPicture.asset(
                    AssetsManager.eye,
                    width: 30,height: 30,
                  ),
                ),
              ),
            ),
            Spacer(flex: 3,),
            CustomButton(text: "Update Password", onPressed: (){})
          ],
        ),
      ),
    );
  }
}
