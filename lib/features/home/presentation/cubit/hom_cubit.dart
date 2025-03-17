import 'package:bookia/features/home/data/models/get_best_seller_response/get_best_seller_response.dart';
import 'package:bookia/features/home/data/models/get_slider_response/get_slider_response.dart';
import 'package:bookia/features/home/data/repo/home_repo.dart';
import 'package:bookia/features/home/presentation/cubit/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  GetSliderResponse? sliderResponse;
  GetBestSellerResponse? bestSellersResponse;
  getSlider() {
    emit(SliderLoadingState());
    HomeRepo.getSlider().then((value) {
      if (value != null) {
        sliderResponse = value;
        emit(SliderSuccessState());
      } else {
        emit(SliderErrorState(error: 'something went wrong'));
      }
    });
  }

  
  getBestSeller() {
    emit(BestSellerLoadingState());
    HomeRepo.getBestSellers().then((value) {
      if (value != null) {
        bestSellersResponse = value;
        emit(BestSellerSuccessState());
      } else {
        emit(BestSellerErrorState(error: 'something went wrong'));
      }
    });
  }
}