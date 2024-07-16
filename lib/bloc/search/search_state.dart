import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

import '../../models/movie/movies_result.dart';

class SearchState extends Equatable {
  final MoviesResult? movies;
  final FormzSubmissionStatus movieStatus;

  const SearchState({
    this.movies,
    this.movieStatus = FormzSubmissionStatus.initial,
  });

  SearchState copyWith({
    MoviesResult? movies,
    FormzSubmissionStatus? movieStatus,
  }) =>
      SearchState(
        movies: movies ?? this.movies,
        movieStatus: movieStatus ?? FormzSubmissionStatus.initial,
      );

  @override
  List<Object?> get props => [
        movies,
        movieStatus,
      ];
}
