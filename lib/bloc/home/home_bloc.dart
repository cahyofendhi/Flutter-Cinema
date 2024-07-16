import 'package:bloc/bloc.dart';
import 'package:cinema_flt/bloc/home/home_event.dart';
import 'package:cinema_flt/bloc/home/home_state.dart';
import 'package:cinema_flt/services/network_client.dart';
import 'package:formz/formz.dart';

import '../../models/service_model.dart';
import '../../repository/database_repository.dart';
import '../../repository/movie_repository.dart';
import '../../services/service.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  MovieRepository? _repository;

  HomeBloc() : super(const HomeState()) {
    final dbRepository = DatabaseRepository();
    _repository = MovieRepository(Service(NetworkClient()), dbRepository);
    on<HomeInitEvent>(_init);
    on<HomeUpcomingEvent>(_loadUpcoming);
    on<HomePopularEvent>(_loadPopular);
    on<HomeTrendingEvent>(_loadTrending);
  }

  void _init(HomeInitEvent event, Emitter<HomeState> emit) {
    add(HomeUpcomingEvent());
    add(HomePopularEvent());
    add(HomeTrendingEvent());
  }

  void _loadUpcoming(HomeUpcomingEvent event, Emitter<HomeState> emit) async {
    emit(state.copyWith(upcomingStatus: FormzSubmissionStatus.inProgress));
    try {
      await for (ServiceModel result in _repository!.getUpcomingMovie(1)) {
        emit(state.copyWith(
            upcoming: result.data,
            upcomingStatus: FormzSubmissionStatus.success));
      }
    } catch (err) {
      emit(state.copyWith(upcomingStatus: FormzSubmissionStatus.failure));
    }
  }

  void _loadPopular(HomePopularEvent event, Emitter<HomeState> emit) async {
    emit(state.copyWith(popularStatus: FormzSubmissionStatus.inProgress));
    try {
      await for (ServiceModel result in _repository!.getPopulerMovie(1)) {
        emit(state.copyWith(
            popular: result.data,
            popularStatus: FormzSubmissionStatus.success));
      }
    } catch (err) {
      emit(state.copyWith(popularStatus: FormzSubmissionStatus.failure));
    }
  }

  void _loadTrending(HomeTrendingEvent event, Emitter<HomeState> emit) async {
    emit(state.copyWith(trendingStatus: FormzSubmissionStatus.inProgress));
    try {
      await for (ServiceModel result in _repository!.getPopulerMovie(1)) {
        emit(state.copyWith(
            trending: result.data,
            trendingStatus: FormzSubmissionStatus.success));
      }
    } catch (err) {
      emit(state.copyWith(trendingStatus: FormzSubmissionStatus.success));
    }
  }

  @override
  Future<void> close() {
    return super.close();
  }
}
