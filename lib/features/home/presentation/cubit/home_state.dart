class HomeState {}

class HomeInitial extends HomeState {}

class BestSellerLoadingState extends HomeState {}

class BestSellerSuccessState extends HomeState {}

class BestSellerErrorState extends HomeState {
  final String error;

  BestSellerErrorState({required this.error});
}

class SliderLoadingState extends HomeState {}

class SliderSuccessState extends HomeState {}

class SliderErrorState extends HomeState {
  final String error;

  SliderErrorState({required this.error});
}

class AddToWishlistSuccessState extends HomeState {}

class AddToWishlistLoadingState extends HomeState {}

class AddToWishlistErrorState extends HomeState {
  final String error;

  AddToWishlistErrorState({required this.error});
}
