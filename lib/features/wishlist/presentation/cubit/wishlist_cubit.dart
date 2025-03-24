import 'dart:developer';

import 'package:bookia/features/cart/data/repo/cart_repo.dart';
import 'package:bookia/features/wishlist/data/model/get_wishlist_response/get_wishlist_response.dart';
import 'package:bookia/features/wishlist/data/repo/wishlist_repo.dart';
import 'package:bookia/features/wishlist/presentation/cubit/wishlist_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WishlistCubit extends Cubit<WishlistState> {
  WishlistCubit() : super(WishlistInitial());
  GetWishlistResponse? response;

  Future<void> getWishlist() async {
    emit(GetWishlistLoadingState());
    await WishlistRepo.getWishlist().then((value) {
      if (value != null) {
        response = value;
        emit(GetWishlistSuccessState());
      } else {
        emit(GetWishlistErrorState(error: 'something went wrong'));
      }
    });
  }

  removeFromWishlist(int bookId) {
    emit(RemoveFromWishlistLoadingState());
    WishlistRepo.removeFromWishlist(bookId).then((value) {
      if (value != null) {
        response = value;

        emit(RemoveFromWishlistSuccessState());
      } else {
        emit(RemoveFromWishlistErrorState(error: 'something went wrong'));
      }
    });
  }

  Future<void> addToCart(int bookId) async {
    emit(AddToCartLoadingState());
    await CartRepo.addToCart(bookId).then((value) {
      if (value) {
        log("added to cart");
        emit(AddToCartSuccessState());
      } else {
        log("not added to cart");
        emit(AddToCartErrorState('something went wrong'));
      }
    });
  }
}
