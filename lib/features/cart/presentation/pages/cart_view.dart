import 'package:bookia/core/utils/text_styles.dart';
import 'package:bookia/core/widgets/custom_buttons.dart';
import 'package:bookia/core/widgets/dialogs.dart';
import 'package:bookia/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:bookia/features/cart/presentation/cubit/cart_state.dart';
import 'package:bookia/features/cart/presentation/widgets/cart_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartCubit()..getCart(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Wishlist"),
          centerTitle: true,
        ),
        body: BlocConsumer<CartCubit, CartState>(
          listener: (context, state) {
            if (state is RemoveFromCartSuccessState) {
              context.read<CartCubit>().getCart();
            }
            if (state is UpdateCartSuccessState) {
              context.read<CartCubit>().getCart();
            }
          },
          builder: (context, state) {
            if (state is CartSuccessState) {
              var books =
                  context.read<CartCubit>().response?.data?.cartItems ?? [];
              var total = context.read<CartCubit>().response?.data?.total ?? 0;
              return books.isEmpty
                  ? const Center(
                      child: Text("No books in wishlist"),
                    )
                  : Padding(
                      padding: const EdgeInsets.all(22.0),
                      child: Column(children: [
                        Expanded(
                          child: ListView.separated(
                              itemBuilder: (context, index) {
                                return CartBody(
                                  book: books[index],
                                  onRemove: () {
                                    context.read<CartCubit>().removeFromCart(
                                        books[index].itemId ?? 0);
                                  },
                                  onAdd: () {
                                    if ((books[index].itemQuantity ?? 0) <
                                        (books[index].itemProductStock ?? 0)) {
                                      context.read<CartCubit>().updateCart(
                                          books[index].itemId ?? 0,
                                          (books[index].itemQuantity ?? 0) + 1);
                                    } else {
                                      showErrorToast(context, "Out of stock");
                                    }
                                  },
                                  onMinus: () {
                                    if ((books[index].itemQuantity ?? 0) > 1) {
                                      context.read<CartCubit>().updateCart(
                                          books[index].itemId ?? 0,
                                          (books[index].itemQuantity ?? 0) - 1);
                                    } else {
                                      showErrorToast(
                                          context, "Minimum quantity is 1");
                                    }
                                  },
                                );
                              },
                              separatorBuilder: (context, index) =>
                                  const Divider(
                                    height: 30,
                                  ),
                              itemCount: books.length),
                        ),
                        Column(children: [
                          const Divider(
                            height: 30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "total",
                                style: getBodyTextStyle(context),
                              ),
                              Text(
                                "$total \$",
                                style: getBodyTextStyle(context),
                              )
                            ],
                          ),
                          Gap(10),
                          CustomButton(text: "Checkout", onPressed: () {})
                        ])
                      ]),
                    );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
