import 'package:bookia/core/constants/assets_manager.dart';
import 'package:bookia/core/utils/text_styles.dart';
import 'package:bookia/core/widgets/pop_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BookDetails extends StatelessWidget {
  const BookDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const PopContainer(),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () {}, icon: SvgPicture.asset(AssetsManager.bookmark))
        ],
      ),
      body: Expanded(
        child: Column(crossAxisAlignment: CrossAxisAlignment.center,
          children: [
          Container(width: 190,height: 270,alignment: Alignment.center,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(AssetsManager.bgimage), fit: BoxFit.cover),
            ),
            
          ),
          Text('data',style: getTitleTextStyle(context),)
        ],),
      ),
    );
  }
}
