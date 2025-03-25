import 'package:bookia/core/utils/app_colors.dart';
import 'package:bookia/core/utils/text_styles.dart';
import 'package:bookia/features/cart/data/model/cart_response/cart_item.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CartBody extends StatelessWidget {
  const CartBody(
      {super.key,
      required this.book,
      required this.onRemove,
      required this.onAdd,
      required this.onMinus});
  final CartItem? book;
  final Function()? onRemove;
  final Function()? onAdd;
  final Function()? onMinus;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: CachedNetworkImage(
            imageUrl: book?.itemProductImage ?? "",
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
                    book?.itemProductName ?? "",
                    style: getBodyTextStyle(context),
                  )),
                  IconButton(onPressed: onRemove, icon: const Icon(Icons.close))
                ],
              ),
              const Gap(10),
              Text(
                "${book?.itemProductPrice} \$",
                style: getBodyTextStyle(context, fontSize: 16),
              ),
              const Gap(10),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  FloatingActionButton.small(
                      elevation: 0,
                      backgroundColor: AppColors.accentColor,
                      onPressed: onMinus,
                      child: const Icon(Icons.remove)),
                  Text(
                    "${book?.itemQuantity}",
                    style: getBodyTextStyle(context),
                  ),
                  FloatingActionButton.small(
                      elevation: 0,
                      backgroundColor: AppColors.accentColor,
                      onPressed: onAdd,
                      child: const Icon(Icons.add))
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
