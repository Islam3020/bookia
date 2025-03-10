
import 'package:bookia/core/constants/assets_manager.dart';
import 'package:bookia/features/auth/presentation/widgets/login_way_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginWays extends StatelessWidget {
  const LoginWays({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return   Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        LoginWayItem(
          widget: SvgPicture.asset(AssetsManager.facebook),
        ),
        LoginWayItem(
            widget:
                SvgPicture.asset(AssetsManager.apple)),
        LoginWayItem(
          widget: SvgPicture.asset(AssetsManager.apple)
        ),
      ],
    );
  }
}
