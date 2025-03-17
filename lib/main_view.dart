import 'package:bookia/core/constants/assets_manager.dart';
import 'package:bookia/core/utils/app_colors.dart';
import 'package:bookia/features/home/presentation/pages/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  List<Widget> pages = [
    const HomeView(),
    const HomeView(),
    const HomeView(),
    const HomeView(),
  ];
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: AppColors.accentColor,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          currentIndex: currentIndex,
          onTap: (value) {
            setState(() {
              currentIndex = value;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset(AssetsManager.home),
              label: "Home",
              activeIcon: SvgPicture.asset(
                AssetsManager.home,
                colorFilter: const ColorFilter.mode(
                    AppColors.primaryColor, BlendMode.srcIn),
              ),
            ),
            BottomNavigationBarItem(
                icon: SvgPicture.asset(AssetsManager.cart),
                label: "cart",
                activeIcon: SvgPicture.asset(
                  AssetsManager.cart,
                  colorFilter: const ColorFilter.mode(
                      AppColors.primaryColor, BlendMode.srcIn),
                )),
            BottomNavigationBarItem(
                icon: SvgPicture.asset(AssetsManager.bookmark),
                label: "bookmark",
                activeIcon: SvgPicture.asset(
                  AssetsManager.bookmark,
                  colorFilter: const ColorFilter.mode(
                      AppColors.primaryColor, BlendMode.srcIn),
                )),
            BottomNavigationBarItem(
                icon: SvgPicture.asset(AssetsManager.profile),
                label: "profile",
                activeIcon: SvgPicture.asset(
                  AssetsManager.profile,
                  colorFilter: const ColorFilter.mode(
                      AppColors.primaryColor, BlendMode.srcIn),
                )),
          ]),
    );
  }
}
