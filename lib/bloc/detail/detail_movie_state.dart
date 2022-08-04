import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

import '../../models/media_credit.dart';
import '../../models/movie/movie.dart';
import '../../models/similar_result.dart';

class DetailMovieState extends Equatable {
  final Movie? movie;
  final MediaCredit? credit;
  final SimilarResult? similiar;
  final FormzStatus creditStatus;
  final FormzStatus similiarStatus;

  const DetailMovieState({
    this.movie,
    this.credit,
    this.similiar,
    this.creditStatus = FormzStatus.pure,
    this.similiarStatus = FormzStatus.pure,
  });

  DetailMovieState copyWith({
    Movie? movie,
    MediaCredit? credit,
    SimilarResult? similiar,
    FormzStatus? creditStatus,
    FormzStatus? similiarStatus,
  }) =>
      DetailMovieState(
        movie: movie ?? this.movie,
        credit: credit ?? this.credit,
        similiar: similiar ?? this.similiar,
        creditStatus: creditStatus ?? FormzStatus.pure,
        similiarStatus: similiarStatus ?? FormzStatus.pure,
      );

  @override
  List<Object?> get props => [
        movie,
        credit,
        similiar,
        creditStatus,
        similiarStatus,
      ];
}
