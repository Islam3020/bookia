import 'dart:developer';

import 'package:bookia/core/services/app_endpoints.dart';
import 'package:bookia/core/services/dio_provider.dart';
import 'package:bookia/core/services/local_helper.dart';
import 'package:bookia/features/checkout/data/models/checkout_reguest/checkout_request.dart';

class CheckoutRepo {
  static Future<bool> checkOut() async {
    try {
      var response = await DioProvider.get(
          endpoint: AppEndpoints.checkout,
          headers: {
            "Authorization":
                "Bearer ${LocalHelper.getCachedData(LocalHelper.tokenkey)}"
          });
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } on Exception catch (e) {
      log(e.toString());
      return false;
    }
  }

  static Future<bool> getCheckout(CheckoutParams params) async {
    try {
      var response = await DioProvider.post(
          endpoint: AppEndpoints.placeOrder,
          data: params.toJson(),
          headers: {
            "Authorization":
                "Bearer ${LocalHelper.getCachedData(LocalHelper.tokenkey)}"
          });
      if (response.statusCode == 201) {
        return true;
      } else {
        return false;
      }
    } on Exception catch (e) {
      log(e.toString());
      return false;
    }
  }
}
