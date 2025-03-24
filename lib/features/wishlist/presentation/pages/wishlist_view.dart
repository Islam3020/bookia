import 'package:bookia/core/widgets/dialogs.dart';
import 'package:bookia/features/wishlist/presentation/cubit/wishlist_cubit.dart';
import 'package:bookia/features/wishlist/presentation/cubit/wishlist_state.dart';
import 'package:bookia/features/wishlist/presentation/widgets/wishlist_body.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WishlistView extends StatelessWidget {
  const WishlistView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WishlistCubit()..getWishlist(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Wishlist"),
          centerTitle: true,
        ),
        body: BlocConsumer<WishlistCubit, WishlistState>(
          listener: (context, state) {
            if (state is RemoveFromWishlistSuccessState) {
              context.read<WishlistCubit>().getWishlist();
            }
            if (state is AddToCartSuccessState) {
              showErrorToast(context, "Added to cart");
              context.read<WishlistCubit>().getWishlist();
            }
          },
          buildWhen: (previous, current) =>
              current is GetWishlistSuccessState ||
              current is RemoveFromWishlistSuccessState ||
              current is GetWishlistLoadingState ||
              current is GetWishlistErrorState ||
              current is RemoveFromWishlistLoadingState ||
              current is RemoveFromWishlistErrorState||
              current is AddToCartSuccessState,
          builder: (context, state) {
            if (state is GetWishlistSuccessState) {
              var books =
                  context.read<WishlistCubit>().response?.data?.data ?? [];
              return books.isEmpty
                  ? const Center(
                      child: Text("No books in wishlist"),
                    )
                  : ListView.separated(
                      padding: const EdgeInsets.all(22),
                      itemBuilder: (context, index) {
                        return WishlistBody(
                          book: books[index],
                          onRemove: () {
                            context
                                .read<WishlistCubit>()
                                .removeFromWishlist(books[index].id ?? 0);
                          },
                          addToCart: () {
                            context
                                .read<WishlistCubit>()
                                .addToCart(books[index].id ?? 0);
                          },
                        );
                      },
                      separatorBuilder: (context, index) => const Divider(
                            height: 30,
                          ),
                      itemCount: books.length);
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
