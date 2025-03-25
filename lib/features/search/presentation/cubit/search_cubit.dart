import 'package:bookia/features/search/data/model/get_search_response/get_search_response.dart';
import 'package:bookia/features/search/data/repo/search_repo.dart';
import 'package:bookia/features/search/presentation/cubit/search_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchCubit extends Cubit<SearchState>{
  SearchCubit() : super(SearchInitial());

  GetSearchResponse? response;

  Future<void> search(String query) async {
    emit(SearchLoading());
    await SearchRepo.getSearch(query).then((value) {if (value != null) {
        response = value;
        emit(SearchSuccess());
      } else {
        emit(SearchErrorState( 'something went wrong'));
      } });
    
  }
}