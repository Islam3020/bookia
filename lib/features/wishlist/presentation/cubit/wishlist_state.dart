class WishlistState {}

class WishlistInitial extends WishlistState {}

class GetWishlistLoadingState extends WishlistState {}

class GetWishlistSuccessState extends WishlistState {}

class GetWishlistErrorState extends WishlistState {
  final String error;
  GetWishlistErrorState({required this.error});
}

class RemoveFromWishlistLoadingState extends WishlistState {}

class RemoveFromWishlistSuccessState extends WishlistState {}

class RemoveFromWishlistErrorState extends WishlistState {
  final String error;
  RemoveFromWishlistErrorState({required this.error});
}

class AddToCartLoadingState extends WishlistState {}

class AddToCartSuccessState extends WishlistState {}

class AddToCartErrorState extends WishlistState {
  final String message;

  AddToCartErrorState(this.message);
}
