import 'dart:async';

import 'package:cinema_flt/models/tv/tv_result.dart';
import 'package:cinema_flt/repository/tv_repository.dart';
import 'package:cinema_flt/utils/request_state.dart';
import 'package:flutter/foundation.dart';
// import 'package:moor_flutter/moor_flutter.dart';

class TvBloc {
  final TvRepository _tvRepository;

  // tv controller
  final _populerController = StreamController<TvResult>.broadcast();
  final _topController = StreamController<TvResult>.broadcast();
  final _onAirController = StreamController<TvResult>.broadcast();

  // state controller
  final _statePopuler = StreamController<UiState>.broadcast();

  // state output
  Stream<UiState> get statePopuler => _statePopuler.stream;

  // output
  Stream<TvResult> get populerTv => _populerController.stream;
  Stream<TvResult> get topTv => _topController.stream;
  Stream<TvResult> get onAir => _onAirController.stream;

  TvBloc({@required tvRepository}) : _tvRepository = tvRepository;

  Future<void> getTvContent() async {
    try {
      await getPopulerTv();
      await getTopTv();
      await getOnAirTv();
    } catch (er) {
      throw er;
    }
  }

  Future<void> getPopulerTv([int page = 1]) async {
    try {
      await _tvRepository.getPopullerTv(page: page).then((response) {
        TvResult data = response.data;
        if (response.isSuccess) _populerController.sink.add(data);
      });
    } catch (err) {
      print('Error populer tv ${err.toString()}');
    }
  }

  Future<void> getTopTv([int page = 1]) async {
    try {
      await _tvRepository.getTopRateTv(page: page).then((response) {
        TvResult data = response.data;
        print('TV Top Rate : ${data.results.length}');
        if (response.isSuccess) _topController.sink.add(data);
      });
    } catch (err) {
      print('Error top tv ${err.toString()}');
    }
  }

  Future<void> getOnAirTv([int page = 1]) async {
    try {
      await _tvRepository.getOnAirTv(page: page).then((response) {
        TvResult data = response.data;
        if (response.isSuccess) _onAirController.sink.add(data);
      });
    } catch (err) {
      print('Error on Air TV ${err.toString()}');
    }
  }

  void dispose() {
    _populerController.close();
    _topController.close();
    _onAirController.close();
    _statePopuler.close();
  }
}
