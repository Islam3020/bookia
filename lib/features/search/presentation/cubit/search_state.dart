class SearchState {}

class SearchInitial extends SearchState {}

class SearchLoading extends SearchState {}

class SearchSuccess extends SearchState {}

class SearchErrorState extends SearchState {
  String message;

  SearchErrorState(this.message);
}