import 'package:bookia/features/home/data/models/get_best_seller_response/get_best_seller_response.dart';
import 'package:bookia/features/home/data/models/get_slider_response/get_slider_response.dart';
import 'package:bookia/features/home/data/repo/home_repo.dart';
import 'package:bookia/features/home/presentation/cubit/home_state.dart';
import 'package:bookia/features/wishlist/data/repo/wishlist_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  GetSliderResponse? sliderResponse;
  GetBestSellerResponse? bestSellersResponse;
  Future<void> getSlider() async {
    emit(SliderLoadingState());
    await HomeRepo.getSlider().then((value) {
      if (value != null) {
        sliderResponse = value;
        emit(SliderSuccessState());
      } else {
        emit(SliderErrorState(error: 'something went wrong'));
      }
    });
  }

  Future<void> getBestSeller() async {
    emit(BestSellerLoadingState());
    await HomeRepo.getBestSellers().then((value) {
      if (value != null) {
        bestSellersResponse = value;
        emit(BestSellerSuccessState());
      } else {
        emit(BestSellerErrorState(error: 'something went wrong'));
      }
    });
  }

  Future<void> addToWishlist(int bookId) async {
    emit(AddToWishlistLoadingState());
    await WishlistRepo.addToWishlist(bookId).then((value) {
      if (value) {
        emit(AddToWishlistSuccessState());
      } else {
        emit(AddToWishlistErrorState(error: 'something went wrong'));
      }
    });
  }
}
