import 'package:bookia/core/constants/assets_manager.dart';
import 'package:bookia/core/utils/app_colors.dart';
import 'package:bookia/core/utils/text_styles.dart';
import 'package:bookia/core/widgets/custom_buttons.dart';
import 'package:bookia/core/widgets/dialogs.dart';
import 'package:bookia/core/widgets/pop_container.dart';
import 'package:bookia/features/home/data/models/get_best_seller_response/product.dart';
import 'package:bookia/features/home/presentation/cubit/hom_cubit.dart';
import 'package:bookia/features/home/presentation/cubit/home_state.dart';
import 'package:bookia/features/wishlist/presentation/cubit/wishlist_cubit.dart';
import 'package:bookia/features/wishlist/presentation/cubit/wishlist_state.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class BookDetails extends StatelessWidget {
  const BookDetails({super.key, required this.book});
  final Product book;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomeCubit(),
        ),
        BlocProvider(
          create: (context) => WishlistCubit(),
        ),
      ],
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {
          if (state is AddToWishlistSuccessState) {
            showErrorToast(context, "book added to wishlist");
            Navigator.pop(context);
          } else if (state is AddToWishlistErrorState) {
            Navigator.pop(context);
            showErrorToast(context, state.error);
          } else if (state is AddToWishlistLoadingState) {
            showLoadingDialog(context);
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: const PopContainer(),
              automaticallyImplyLeading: false,
              actions: [
                IconButton(
                    onPressed: () {
                      context.read<HomeCubit>().addToWishlist(book.id ?? 0);
                    },
                    icon: SvgPicture.asset(AssetsManager.bookmark))
              ],
            ),
            body: Padding(
              padding: const EdgeInsets.all(22.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Hero(
                      tag: book.id ?? '',
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: CachedNetworkImage(
                          imageUrl: book.image ?? '',
                          fit: BoxFit.cover,
                          height: 270,
                        ),
                      ),
                    ),
                    const Gap(10),
                    Text(
                      book.name ?? '',
                      textAlign: TextAlign.center,
                      style: getTitleTextStyle(context),
                    ),
                    const Gap(10),
                    Text(
                      book.category ?? '',
                      style: getBodyTextStyle(context,
                          color: AppColors.primaryColor),
                    ),
                    Text(
                      book.description ?? '',
                      textAlign: TextAlign.justify,
                      style: getSmallTextStyle(color: AppColors.darkColor),
                    ),
                  ],
                ),
              ),
            ),
            bottomNavigationBar: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Padding(
                padding: const EdgeInsets.all(22.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '₹285',
                        style: getTitleTextStyle(context),
                      ),
                      BlocListener<WishlistCubit, WishlistState>(
                        listener: (context, state) {
                          if (state is AddToCartSuccessState) {
                            showErrorToast(context, "Added to cart");
                            
                          }
                        },
                        child: CustomButton(
                            width: 220,
                            height: 65,
                            text: 'Add to Cart',
                            onPressed: () {
                              context
                                  .read<WishlistCubit>()
                                  .addToCart(book.id ?? 0);
                            }),
                      )
                    ]),
              ),
            ),
          );
        },
      ),
    );
  }
}
