import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

import '../../models/movie/movies_result.dart';

class SearchState extends Equatable {
  final MoviesResult? movies;
  final FormzStatus movieStatus;

  const SearchState({
    this.movies,
    this.movieStatus = FormzStatus.pure,
  });

  SearchState copyWith({
    MoviesResult? movies,
    FormzStatus? movieStatus,
  }) =>
      SearchState(
        movies: movies ?? this.movies,
        movieStatus: movieStatus ?? FormzStatus.pure,
      );

  @override
  List<Object?> get props => [
        movies,
        movieStatus,
      ];
}
