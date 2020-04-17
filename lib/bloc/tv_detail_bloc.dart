

import 'dart:async';

import 'package:cinema_flt/models/service_model.dart';
import 'package:cinema_flt/models/tv/tv_detail.dart';
import 'package:cinema_flt/repository/tv_repository.dart';
import 'package:cinema_flt/utils/request_state.dart';
import 'package:flutter/material.dart';

class TvDetailBloc {

  final TvRepository _tvRepository;

  final _movieController = StreamController<TV>.broadcast();
  final _uiStateMovieController = StreamController<UiState>.broadcast();

  Stream<TV> get movie => _movieController.stream;
  Stream<UiState> get stateMovie => _uiStateMovieController.stream;

  Function(TV) get setDataMovie => _movieController.sink.add;
  Function(UiState) get setUiStateMovie => _uiStateMovieController.sink.add;

  TvDetailBloc({@required tvRepository}) : _tvRepository = tvRepository;
  
  Future<void> getTvDetail(int tvId) async {
    try {
      ServiceModel result = await _tvRepository.getTvDetail(tvId);
      if (result.isSuccess) {
        TV tv = result.data;
        setDataMovie(tv);
      }
    } catch (err) {
      print('Error = $err');
    }
  }

  void dispose() {
    _movieController.close();
    _uiStateMovieController.close();
  }

}