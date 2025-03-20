
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

class BestSellerBooks extends StatefulWidget {
  const BestSellerBooks({
    super.key,
  });

  @override
  State<BestSellerBooks> createState() => _BestSellerBooksState();
}

class _BestSellerBooksState extends State<BestSellerBooks> {
   @override
  void initState() {
    super.initState();
     context.read<HomeCubit>().getBestSeller();
  }
  @override
  Widget build(BuildContext context) {

    
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is BestSellerLoadingState) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is BestSellerErrorState) {
          return const Center(child: CircularProgressIndicator());
        } 
          
          List<Product> books =
            context.read<HomeCubit>().bestSellersResponse?.data?.products ?? [];

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
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      mainAxisExtent: 270),
                  itemCount: books.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(onTap: () {
                      context.pushTo(const BookDetails());
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
                                    child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: CachedNetworkImage(imageUrl: books[index].image ??'',fit: BoxFit.cover,),
                                )),
                                const Gap(10),
                                Text(
                                  books[index].name ?? '',
                                  style: getBodyTextStyle(context),
                                ),
                                const Gap(5),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "\$${books[index].price ?? ''}",
                                      style:
                                          getBodyTextStyle(context, fontSize: 16),
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
      },
    );
  }
}
