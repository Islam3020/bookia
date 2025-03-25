import 'package:bookia/core/constants/assets_manager.dart';
import 'package:bookia/core/extension/extensions.dart';
import 'package:bookia/core/utils/app_colors.dart';
import 'package:bookia/core/utils/text_styles.dart';
import 'package:bookia/features/search/data/model/get_search_response/product.dart';
import 'package:bookia/features/search/presentation/cubit/search_cubit.dart';
import 'package:bookia/features/search/presentation/cubit/search_state.dart';
import 'package:bookia/features/search/presentation/widgets/search_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController searchController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: TextFormField(
          controller: searchController,
        ),
        actions: [
          IconButton(
            icon: SvgPicture.asset(AssetsManager.search),
            onPressed: () {
              context.read<SearchCubit>().search(searchController.text);
            },
          ),
        ],
      ),
      body: BlocBuilder<SearchCubit, SearchState>(
        builder: (context, state) {
          if (state is SearchLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is SearchSuccess) {
            List<Product> products =
                context.read<SearchCubit>().response?.data?.products ?? [];
            return products.isEmpty
                ? const Center(child: Text("No products found."))
                : ListView.builder(
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      final product = products[index];
                      return GestureDetector(
                        onTap: () {
                          context.pushTo(SearchDetails(book: product));
                        },
                        child: Container(
                            margin: const EdgeInsets.all(10),
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: AppColors.accentColor,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.network(
                                    product.image ?? "",
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
                                            product.name ?? "",
                                            style: getBodyTextStyle(context),
                                          )),
                                        ],
                                      ),
                                      const Gap(10),
                                      Text(
                                        "${product.price} \$",
                                        style: getBodyTextStyle(context,
                                            fontSize: 16),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            )),
                      );
                    },
                  );
          } else if (state is SearchErrorState) {
            return Center(child: Text(state.message));
          }
          return Center(child: Text("Start typing to search..."));
        },
      ),
    );
  }
}
