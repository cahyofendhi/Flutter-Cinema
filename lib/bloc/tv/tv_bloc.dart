import 'package:bloc/bloc.dart';
import 'package:cinema_flt/bloc/tv/tv_event.dart';
import 'package:cinema_flt/bloc/tv/tv_state.dart';
import 'package:cinema_flt/services/network_client.dart';
import 'package:formz/formz.dart';

import '../../repository/database_repository.dart';
import '../../repository/tv_repository.dart';
import '../../services/service.dart';

class TvBloc extends Bloc<TvEvent, TvState> {
  TvRepository? _repository;

  TvBloc() : super(const TvState()) {
    final dbRepository = DatabaseRepository();
    _repository = TvRepository(Service(NetworkClient()), dbRepository);
    on<TvInitEvent>(_init);
    on<TvTopEvent>(_loadTop);
    on<TvPopularEvent>(_loadPopular);
    on<TvOnAirEvent>(_loadOnAir);
  }

  void _init(TvInitEvent event, Emitter<TvState> emit) {
    add(TvTopEvent());
    add(TvPopularEvent());
    add(TvOnAirEvent());
  }

  void _loadTop(TvTopEvent event, Emitter<TvState> emit) async {
    emit(state.copyWith(topStatus: FormzStatus.submissionInProgress));
    try {
      final response = await _repository!.getTopRateTv();
      emit(state.copyWith(
          top: response.data, topStatus: FormzStatus.submissionSuccess));
    } catch (err) {
      emit(state.copyWith(topStatus: FormzStatus.submissionFailure));
    }
  }

  void _loadPopular(TvPopularEvent event, Emitter<TvState> emit) async {
    emit(state.copyWith(popularStatus: FormzStatus.submissionInProgress));
    try {
      final response = await _repository!.getPopullerTv();
      emit(state.copyWith(
          popular: response.data,
          popularStatus: FormzStatus.submissionSuccess));
    } catch (err) {
      emit(state.copyWith(popularStatus: FormzStatus.submissionFailure));
    }
  }

  void _loadOnAir(TvOnAirEvent event, Emitter<TvState> emit) async {
    emit(state.copyWith(onAirStatus: FormzStatus.submissionInProgress));
    try {
      final response = await _repository!.getOnAirTv();
      emit(state.copyWith(
          onAir: response.data, onAirStatus: FormzStatus.submissionSuccess));
    } catch (err) {
      emit(state.copyWith(onAirStatus: FormzStatus.submissionFailure));
    }
  }

  @override
  Future<void> close() {
    return super.close();
  }
}
