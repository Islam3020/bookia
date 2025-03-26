import 'dart:developer';

import 'package:bookia/core/services/app_endpoints.dart';
import 'package:bookia/core/services/dio_provider.dart';
import 'package:bookia/features/search/data/model/get_search_response/get_search_response.dart';

class SearchRepo {
  static Future<GetSearchResponse?> getSearch(String query) async {
    try {
      var response = await DioProvider.get(
        endpoint: AppEndpoints.search,
        params: {"name": query},
      );
      if (response.statusCode == 200) {
        return GetSearchResponse.fromJson(response.data);
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }
}
