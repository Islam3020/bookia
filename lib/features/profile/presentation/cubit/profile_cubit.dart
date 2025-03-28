import 'dart:developer';

import 'package:bookia/features/profile/data/models/profile_response/profile_response.dart';
import 'package:bookia/features/profile/data/repo/profile_repo.dart';
import 'package:bookia/features/profile/presentation/cubit/profile_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());
  ProfileResponse? profileResponse;

  Future getProfile()async{
    emit(ProfileLoading());
    await ProfileRepo.getProfile().then((value) {
      profileResponse = value;
       if (value !=null) {
        profileResponse = value;
        log("profile fetched successfully");
        emit(ProfileLoaded());
      } else {
        emit(ProfileError(errorMessage: 'something went wrong'));
      }
    });

  }
}