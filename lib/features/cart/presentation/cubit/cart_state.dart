class CartState {}

class CartInitial extends CartState {}

class CartLoadingState extends CartState {}

class CartSuccessState extends CartState {}

class CartErrorState extends CartState {
  final String message;

  CartErrorState(this.message);
}

class RemoveFromCartLoadingState extends CartState {}

class RemoveFromCartSuccessState extends CartState {}

class RemoveFromCartErrorState extends CartState {
  final String message;

  RemoveFromCartErrorState(this.message);
}

class UpdateCartLoadingState extends CartState {}

class UpdateCartSuccessState extends CartState {}

class UpdateCartErrorState extends CartState {
  final String message;

  UpdateCartErrorState(this.message);
}

class CheckOutLoadingState extends CartState {}

class CheckOutSuccessState extends CartState {}

class CheckOutErrorState extends CartState {
  final String message;

  CheckOutErrorState({required this.message});
}
