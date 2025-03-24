import 'package:bookia/core/extension/extensions.dart';
import 'package:bookia/core/utils/app_colors.dart';
import 'package:bookia/core/utils/text_styles.dart';
import 'package:bookia/core/widgets/custom_buttons.dart';
import 'package:bookia/features/home/data/models/get_best_seller_response/product.dart';
import 'package:bookia/features/home/presentation/cubit/hom_cubit.dart';
import 'package:bookia/features/home/presentation/cubit/home_state.dart';
import 'package:bookia/features/home/presentation/pages/book_details.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class BestSellerBooks extends StatelessWidget {
  const BestSellerBooks({
    super.key,
  });

  @override
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) =>
          current is BestSellerLoadingState ||
          current is BestSellerErrorState ||
          current is BestSellerSuccessState,
      builder: (context, state) {
        List<Product> books =
            context.read<HomeCubit>().bestSellersResponse?.data?.products ?? [];
        if (state is BestSellerSuccessState) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Best Sellers",
                  style: getTitleTextStyle(context),
                ),
                const Gap(10),
                GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                            mainAxisExtent: 270),
                    itemCount: books.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          context.pushTo(BookDetails(
                            book: books[index],
                          ));
                        },
                        child: Container(
                            decoration: BoxDecoration(
                                color: AppColors.secondryColor,
                                borderRadius: BorderRadius.circular(10)),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                      child: Hero(
                                    tag: books[index].id ?? '',
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: CachedNetworkImage(
                                        imageUrl: books[index].image ?? '',
                                        fit: BoxFit.cover,
                                        width: double.infinity,
                                        errorWidget: (context, url, error) =>
                                            const Center(
                                          child: Icon(Icons.error),
                                        ),
                                      ),
                                    ),
                                  )),
                                  const Gap(5),
                                  Text(
                                    books[index].name ?? '',
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: getBodyTextStyle(context),
                                  ),
                                  const Gap(5),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "\$${books[index].priceAfterDiscount ?? ''}",
                                        style: getBodyTextStyle(context,
                                            fontSize: 16),
                                      ),
                                      CustomButton(
                                          width: 80,
                                          height: 30,
                                          bgColor: AppColors.darkColor,
                                          text: "Buy",
                                          onPressed: () {})
                                    ],
                                  ),
                                ],
                              ),
                            )),
                      );
                    }),
              ],
            ),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
