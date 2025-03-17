import 'package:bookia/core/services/local_helper.dart';
import 'package:bookia/features/auth/data/models/request/auth_params.dart';
import 'package:bookia/features/auth/data/repo/auth_repo.dart';
import 'package:bookia/features/auth/presentation/bloc/cubit/auth_state.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  register(AuthParams params) {
    emit(AuthLoading());
    AuthRepo.register(params).then((value) {
      if (value != null) {
        LocalHelper.cacheData(LocalHelper.tokenkey, value.data?.token);

        emit(AuthSuccess());
      } else {
        emit(AuthError("Something went wrong"));
      }
    });
  }

  login(AuthParams params) {
    emit(AuthLoading());
    AuthRepo.login(params).then((value) {
      if (value != null) {
        LocalHelper.cacheData(LocalHelper.tokenkey, value.data?.token);
        emit(AuthSuccess());
      } else {
        emit(AuthError("Something went wrong"));
      }
    });
  }

  forgetPassword(AuthParams params) {
    emit(AuthLoading());
    AuthRepo.forgetPassword(params).then((value) {
      if (value != null) {
        emit(AuthSuccess());
      } else {
        emit(AuthError("something went wrong"));
      }
    });
  }

  checkForgetPassword(AuthParams params) {
    emit(AuthLoading());
    AuthRepo.forgetPassword(params).then((value) {
      if (value != null) {
        emit(AuthSuccess());
      } else {
        emit(AuthError("something went wrong"));
      }
    });
  }
}
