import 'dart:developer';

import 'package:bookia/core/services/app_endpoints.dart';
import 'package:bookia/core/services/dio_provider.dart';
import 'package:bookia/core/services/local_helper.dart';
import 'package:bookia/features/profile/data/models/profile_response/profile_response.dart';

class ProfileRepo {
  static Future<ProfileResponse?>getProfile()async{
     try {
      var response = await DioProvider.get(
          endpoint: AppEndpoints.profile,
         
          headers: {
            "Authorization":
                "Bearer ${LocalHelper.getCachedData(LocalHelper.tokenkey)}"
          });
      if (response.statusCode == 200) {
        return ProfileResponse.fromJson(response.data);
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }
}