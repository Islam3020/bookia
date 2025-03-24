import 'package:bookia/core/constants/assets_manager.dart';
import 'package:bookia/core/extension/extensions.dart';
import 'package:bookia/core/utils/app_colors.dart';
import 'package:bookia/core/utils/text_styles.dart';
import 'package:bookia/features/profile/presentation/pages/edit_profile.dart';
import 'package:bookia/features/profile/presentation/pages/update_password.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Profile",
          style: getTitleTextStyle(context),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.logout_rounded,
              color: AppColors.darkColor,
            ),
            onPressed: () {},
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                // IMAGE
                const CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage(AssetsManager.bgimage),
                ),
                const Gap(20),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Islam",
                      style: getTitleTextStyle(context),
                    ),
                    Text(
                      "islam123@gmail.com",
                      style: getSmallTextStyle(),
                    ),
                  ],
                ))
              ],
            ),
            const Gap(40),
            Card(
              elevation: 5,
              shadowColor: AppColors.darkGray.withOpacity(.5),
              child: ListTile(
                tileColor: AppColors.backgroundColor,
                title: Text(
                  "My Orders",
                  style: getBodyTextStyle(context),
                ),
                trailing: const Icon(Icons.arrow_forward_ios_rounded),
              ),
            ),
            GestureDetector(
              onTap: () => context.pushTo(const EditProfile()),
              child: Card(
                elevation: 5,
                shadowColor: AppColors.darkGray.withOpacity(.5),
                child: ListTile(
                  tileColor: AppColors.backgroundColor,
                  title: Text(
                    "Edit Profile",
                    style: getBodyTextStyle(context),
                  ),
                  trailing: const Icon(Icons.arrow_forward_ios_rounded),
                ),
              ),
            ),
            GestureDetector(
              onTap: () => context.pushTo(const UpdatePassword()),
              child: Card(
                elevation: 5,
                shadowColor: AppColors.darkGray.withOpacity(.5),
                child: ListTile(
                  tileColor: AppColors.backgroundColor,
                  title: Text(
                    "Reset Password",
                    style: getBodyTextStyle(context),
                  ),
                  trailing: const Icon(Icons.arrow_forward_ios_rounded),
                ),
              ),
            ),
            Card(
              elevation: 5,
              shadowColor: AppColors.darkGray.withOpacity(.5),
              child: ListTile(
                tileColor: AppColors.backgroundColor,
                title: Text(
                  "FAQ",
                  style: getBodyTextStyle(context),
                ),
                trailing: const Icon(Icons.arrow_forward_ios_rounded),
              ),
            ),
            Card(
              elevation: 5,
              shadowColor: AppColors.darkGray.withOpacity(.5),
              child: ListTile(
                tileColor: AppColors.backgroundColor,
                title: Text(
                  "Contact Us",
                  style: getBodyTextStyle(context),
                ),
                trailing: const Icon(Icons.arrow_forward_ios_rounded),
              ),
            ),
            Card(
              elevation: 5,
              shadowColor: AppColors.darkGray.withOpacity(.5),
              child: ListTile(
                tileColor: AppColors.backgroundColor,
                title: Text(
                  "Privacy & Terms",
                  style: getBodyTextStyle(context),
                ),
                trailing: const Icon(Icons.arrow_forward_ios_rounded),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
