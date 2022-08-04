import 'package:cinema_flt/models/movie/movie.dart';
import 'package:equatable/equatable.dart';

abstract class DetailMovieEvent extends Equatable {
  const DetailMovieEvent();
  @override
  List<Object> get props => [];
}

class DetailMovieInitEvent extends DetailMovieEvent {
  final Movie movie;

  DetailMovieInitEvent(this.movie);

  @override
  List<Object> get props => [movie];
}

class LoadDetailMovieEvent extends DetailMovieEvent {
  final int id;

  LoadDetailMovieEvent(this.id);

  @override
  List<Object> get props => [id];
}

class LoadSimiliarDetailMovieEvent extends DetailMovieEvent {
  final int id;

  LoadSimiliarDetailMovieEvent(this.id);

  @override
  List<Object> get props => [id];
}

class LoadCreditDetailMovieEvent extends DetailMovieEvent {
  final int id;

  LoadCreditDetailMovieEvent(this.id);

  @override
  List<Object> get props => [id];
}
