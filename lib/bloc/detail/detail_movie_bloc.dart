import 'package:bloc/bloc.dart';
import 'package:cinema_flt/bloc/detail/detail_movie_event.dart';
import 'package:cinema_flt/services/network_client.dart';
import 'package:formz/formz.dart';

import '../../repository/database_repository.dart';
import '../../repository/movie_repository.dart';
import '../../services/service.dart';
import 'detail_movie_state.dart';

class DetailMovieBloc extends Bloc<DetailMovieEvent, DetailMovieState> {
  MovieRepository? _repository;

  DetailMovieBloc() : super(const DetailMovieState()) {
    final dbRepository = DatabaseRepository();
    _repository = MovieRepository(Service(NetworkClient()), dbRepository);
    on<DetailMovieInitEvent>(_init);
    on<LoadDetailMovieEvent>(_loadDetail);
    on<LoadCreditDetailMovieEvent>(_loadCredit);
    on<LoadSimiliarDetailMovieEvent>(_loadSimiliar);
  }

  void _init(DetailMovieInitEvent event, Emitter<DetailMovieState> emit) {
    emit(state.copyWith(movie: event.movie));
    add(LoadDetailMovieEvent(event.movie.id!));
    add(LoadCreditDetailMovieEvent(event.movie.id!));
    add(LoadSimiliarDetailMovieEvent(event.movie.id!));
  }

  void _loadDetail(
    LoadDetailMovieEvent event,
    Emitter<DetailMovieState> emit,
  ) async {
    try {
      final response = await _repository!.getMovieDetail(event.id);
      emit(state.copyWith(movie: response.data));
    } catch (err) {}
  }

  void _loadCredit(
    LoadCreditDetailMovieEvent event,
    Emitter<DetailMovieState> emit,
  ) async {
    emit(state.copyWith(creditStatus: FormzStatus.submissionInProgress));
    try {
      final response = await _repository!.getMovieMediaCredit(event.id);
      emit(state.copyWith(
          credit: response.data, creditStatus: FormzStatus.submissionSuccess));
    } catch (err) {
      emit(state.copyWith(creditStatus: FormzStatus.submissionFailure));
    }
  }

  void _loadSimiliar(
    LoadSimiliarDetailMovieEvent event,
    Emitter<DetailMovieState> emit,
  ) async {
    emit(state.copyWith(similiarStatus: FormzStatus.submissionInProgress));
    try {
      final response = await _repository!.getMovieSimilar(event.id);
      emit(state.copyWith(
          similiar: response.data,
          similiarStatus: FormzStatus.submissionSuccess));
    } catch (err) {
      emit(state.copyWith(similiarStatus: FormzStatus.submissionFailure));
    }
  }

  @override
  Future<void> close() {
    return super.close();
  }
}
