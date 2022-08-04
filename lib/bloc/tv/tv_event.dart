import 'package:equatable/equatable.dart';

abstract class TvEvent extends Equatable {
  const TvEvent();
  @override
  List<Object> get props => [];
}

class TvInitEvent extends TvEvent {}

class TvTopEvent extends TvEvent {}

class TvPopularEvent extends TvEvent {}

class TvOnAirEvent extends TvEvent {}
