import 'package:bookia/core/utils/app_colors.dart';
import 'package:bookia/features/home/data/models/get_slider_response/slider.dart';
import 'package:bookia/features/home/presentation/cubit/hom_cubit.dart';
import 'package:bookia/features/home/presentation/cubit/home_state.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeSlider extends StatefulWidget {
  const HomeSlider({
    super.key,
  });

  @override
  State<HomeSlider> createState() => _HomeSliderState();
}

class _HomeSliderState extends State<HomeSlider> {
  int currentIndex = 0;

  @override
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) =>
          current is SliderLoadingState ||
          current is SliderErrorState ||
          current is SliderSuccessState,
      builder: (context, state) {
        List<SliderModel> sliders =
            context.read<HomeCubit>().sliderResponse?.data?.sliders ?? [];
        if (state is SliderSuccessState) {
          return Column(
            children: [
              CarouselSlider.builder(
                itemCount: sliders.length,
                itemBuilder:
                    (BuildContext context, int itemIndex, int pageViewIndex) =>
                        ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: CachedNetworkImage(
                              imageUrl: sliders[itemIndex].image ?? '',
                              fit: BoxFit.cover,
                            )),
                options: CarouselOptions(
                  height: 150,
                  aspectRatio: 16 / 9,
                  viewportFraction: 0.9,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 3),
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  onPageChanged: (index, reason) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                  enlargeCenterPage: true,
                  enlargeFactor: 0.3,
                  scrollDirection: Axis.horizontal,
                ),
              ),
              const Gap(10),
              SmoothPageIndicator(
                controller: PageController(initialPage: currentIndex),

                // PageController
                count: sliders.length,

                axisDirection: Axis.horizontal,
                effect: const ExpandingDotsEffect(
                  dotHeight: 7,
                  dotWidth: 7,
                  expansionFactor: 4,
                  spacing: 5,
                  dotColor: AppColors.greyColor,
                  activeDotColor: AppColors.primaryColor,
                ),
              )
            ],
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
