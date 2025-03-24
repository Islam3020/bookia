import 'dart:developer';

import 'package:bookia/features/cart/data/model/cart_response/cart_response.dart';
import 'package:bookia/features/cart/data/repo/cart_repo.dart';
import 'package:bookia/features/cart/presentation/cubit/cart_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  CartResponse? response;

  Future<void> getCart() async {
    emit(CartLoadingState());
    await CartRepo.getCart().then((value) {
      if (value != null) {
        response = value;
        emit(CartSuccessState());
      } else {
        emit(CartErrorState('something went wrong'));
      }
    });
  }

  removeFromCart(int cartItemId) {
    emit(RemoveFromCartLoadingState());
    CartRepo.removeFromCart(cartItemId).then((value) {
      if (value != null) {
        response = value;

        emit(RemoveFromCartSuccessState());
      } else {
        emit(RemoveFromCartErrorState('something went wrong'));
      }
    });
  }

  updateCart(int cartItemId, int quantity) {
    emit(UpdateCartLoadingState());
    CartRepo.updateCart(cartItemId, quantity).then((value) {
      if (value != null) {
        response = value;
        emit(UpdateCartSuccessState());
        log("updated");
      } else {
        emit(UpdateCartErrorState('something went wrong'));
      }
    });
  }
}
