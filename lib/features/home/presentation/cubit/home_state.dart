class HomeState {}

class HomeInitial extends HomeState {}
class HomeInitialState extends HomeState {}

class BestSellerLoadingState extends HomeState {}

class BestSellerSuccessState extends HomeState {}

class SliderLoadingState extends HomeState {}

class SliderSuccessState extends HomeState {}

class AddToWishListCartLoadingState extends HomeState {}

class AddToWishListCartSuccessState extends HomeState {
  final String message;

  AddToWishListCartSuccessState({required this.message});
}

class AddToWishListCartErrorState extends HomeState {
  final String error;

  AddToWishListCartErrorState({required this.error});
}

class BestSellerErrorState extends HomeState {
  final String error;

  BestSellerErrorState({required this.error});
}

class SliderErrorState extends HomeState {
  final String error;

  SliderErrorState({required this.error});
}