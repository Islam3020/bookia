import 'package:bookia/core/constants/assets_manager.dart';
import 'package:bookia/features/home/presentation/cubit/hom_cubit.dart';
import 'package:bookia/features/home/presentation/widgets/best_seller_books.dart';

import 'package:bookia/features/home/presentation/widgets/home_slider.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()
        ..getBestSeller()
        ..getSlider(),
      child: Scaffold(
        appBar: AppBar(
          title: SvgPicture.asset(
            AssetsManager.logo,
            height: 30,
          ),
          actions: [
            IconButton(
              icon: SvgPicture.asset(AssetsManager.notification),
              onPressed: () {},
            ),
            IconButton(
              icon: SvgPicture.asset(AssetsManager.search),
              onPressed: () {},
            ),
          ],
        ),
        body: const SingleChildScrollView(
          child: Column(
            children: [HomeSlider(), Gap(10), BestSellerBooks()],
          ),
        ),
      ),
    );
  }
}
