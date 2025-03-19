import 'package:bookia/core/constants/assets_manager.dart';
import 'package:bookia/core/utils/app_colors.dart';
import 'package:bookia/core/widgets/custom_buttons.dart';
import 'package:bookia/core/widgets/pop_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({super.key});

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
            const Gap(15),
             Stack(children: [
              CircleAvatar(
                radius: 60,
                backgroundColor: AppColors.greyColor,
              ),
              Positioned(
                right: 5,
                bottom: 10,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle, 
                    color: AppColors.backgroundColor
                  ),
                  child: SvgPicture.asset(AssetsManager.camera)),
              ),
            ]),
            const Spacer(
              flex: 1,
            ),
            TextFormField(
              decoration: const InputDecoration(hintText: 'Full Name'),
            ),
            const Gap(15),
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Phone',
              ),
            ),
            const Gap(15),
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Address',
              ),
            ),
            const Spacer(
              flex: 3,
            ),
            CustomButton(text: "Update Profile", onPressed: () {})
          ],
        ),
      ),
    );
  }
}
