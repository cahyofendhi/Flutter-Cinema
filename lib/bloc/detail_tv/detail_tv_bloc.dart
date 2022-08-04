import 'package:bloc/bloc.dart';
import 'package:cinema_flt/bloc/detail_tv/detail_tv_event.dart';
import 'package:cinema_flt/repository/tv_repository.dart';
import 'package:cinema_flt/services/network_client.dart';
import 'package:formz/formz.dart';

import '../../repository/database_repository.dart';
import '../../services/service.dart';
import 'detail_movie_state.dart';

class DetailTvBloc extends Bloc<DetailTvEvent, DetailTvState> {
  TvRepository? _repository;

  DetailTvBloc() : super(const DetailTvState()) {
    final dbRepository = DatabaseRepository();
    _repository = TvRepository(Service(NetworkClient()), dbRepository);
    on<DetailTvInitEvent>(_init);
  }

  void _init(DetailTvInitEvent event, Emitter<DetailTvState> emit) async {
    emit(state.copyWith(
        movie: event.movie, status: FormzStatus.submissionInProgress));
    try {
      final response = await _repository!.getTvDetail(event.movie.id!);
      emit(state.copyWith(
          movie: response.data, status: FormzStatus.submissionSuccess));
    } catch (err) {
      emit(state.copyWith(status: FormzStatus.submissionFailure));
    }
  }

  @override
  Future<void> close() {
    return super.close();
  }
}
