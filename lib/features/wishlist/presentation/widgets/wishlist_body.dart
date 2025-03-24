import 'package:bookia/core/utils/text_styles.dart';
import 'package:bookia/core/widgets/custom_buttons.dart';
import 'package:bookia/features/home/data/models/get_best_seller_response/product.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class WishlistBody extends StatelessWidget {
  const WishlistBody(
      {super.key, required this.book, required this.onRemove, this.addToCart});
  final Product? book;
  final Function()? onRemove;
  final Function()? addToCart;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: CachedNetworkImage(
            imageUrl: book?.image ?? "",
            height: 120,
            width: 100,
            fit: BoxFit.cover,
          ),
        ),
        const Gap(10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                      child: Text(
                    book?.name ?? "",
                    style: getBodyTextStyle(context),
                  )),
                  IconButton(onPressed: onRemove, icon: const Icon(Icons.close))
                ],
              ),
              const Gap(10),
              Text(
                "${book?.price} \$",
                style: getBodyTextStyle(context, fontSize: 16),
              ),
              const Gap(10),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CustomButton(
                      width: 170,
                      height: 40,
                      text: "Add to Cart",
                      onPressed: addToCart ?? () {}),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
