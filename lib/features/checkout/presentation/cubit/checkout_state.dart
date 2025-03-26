class CheckoutState {}

class CheckoutInitial extends CheckoutState {}

class CheckoutLoadingState extends CheckoutState {}

class CheckoutSuccessState extends CheckoutState {}

class CheckoutErrorState extends CheckoutState {
  String message;

  CheckoutErrorState({required this.message});
}