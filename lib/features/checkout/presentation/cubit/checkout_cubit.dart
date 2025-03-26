import 'package:bookia/features/checkout/data/models/checkout_reguest/checkout_request.dart';
import 'package:bookia/features/checkout/data/repo/checkout_repo.dart';
import 'package:bookia/features/checkout/presentation/cubit/checkout_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CheckoutCubit extends Cubit<CheckoutState> {
  CheckoutCubit() : super(CheckoutInitial());

   Future<void> placeOrder(CheckoutParams params) async {
    emit(CheckoutLoadingState());
    final success = await CheckoutRepo.getCheckout(params);
    if (success) {
      emit(CheckoutSuccessState());
    } else {
      emit(CheckoutErrorState(message: "Checkout failed. Please try again."));
    }
  }
}