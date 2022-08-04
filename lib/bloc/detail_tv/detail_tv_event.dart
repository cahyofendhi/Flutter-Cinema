import 'package:cinema_flt/models/tv/tv.dart';
import 'package:equatable/equatable.dart';

abstract class DetailTvEvent extends Equatable {
  const DetailTvEvent();
  @override
  List<Object> get props => [];
}

class DetailTvInitEvent extends DetailTvEvent {
  final TV movie;

  DetailTvInitEvent(this.movie);

  @override
  List<Object> get props => [movie];
}
