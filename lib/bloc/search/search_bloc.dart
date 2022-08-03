import 'package:bloc/bloc.dart';
import 'package:cinema_flt/bloc/search/search_event.dart';
import 'package:cinema_flt/bloc/search/search_state.dart';
import 'package:cinema_flt/services/network_client.dart';
import 'package:formz/formz.dart';

import '../../repository/database_repository.dart';
import '../../repository/movie_repository.dart';
import '../../services/service.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  MovieRepository? _repository;

  SearchBloc() : super(const SearchState()) {
    final dbRepository = DatabaseRepository();
    _repository = MovieRepository(Service(NetworkClient()), dbRepository);
    on<SearchInitEvent>(_init);
    on<SubmitSearchEvent>(_loadSearch);
  }

  void _init(SearchInitEvent event, Emitter<SearchState> emit) {}

  void _loadSearch(SubmitSearchEvent event, Emitter<SearchState> emit) async {
    emit(state.copyWith(movieStatus: FormzStatus.submissionInProgress));
    try {
      final response = await _repository!.getSearchMovie(event.query, 1);
      emit(state.copyWith(
          movies: response.data, movieStatus: FormzStatus.submissionSuccess));
    } catch (err) {
      emit(state.copyWith(movieStatus: FormzStatus.submissionFailure));
    }
  }

  @override
  Future<void> close() {
    return super.close();
  }
}
