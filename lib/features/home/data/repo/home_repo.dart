import 'dart:developer';

import 'package:bookia/core/services/app_endpoints.dart';
import 'package:bookia/core/services/dio_provider.dart';
import 'package:bookia/features/home/data/models/get_best_seller_response/get_best_seller_response.dart';
import 'package:bookia/features/home/data/models/get_slider_response/get_slider_response.dart';

class HomeRepo{
    static Future<GetBestSellerResponse?> getBestSellers() async {
    try {
      var response = await DioProvider.get(
        endpoint: AppEndpoints.bestSellers,
      );
      if (response.statusCode == 200) {
        return GetBestSellerResponse.fromJson(response.data);
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }

  static Future<GetSliderResponse?> getSlider() async {
    try {
      var response = await DioProvider.get(
        endpoint: AppEndpoints.slider,
      );
      if (response.statusCode == 200) {
        return GetSliderResponse.fromJson(response.data);
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }
}